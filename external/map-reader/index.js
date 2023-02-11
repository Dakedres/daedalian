/*
  Detection logic:
    - When we first see a color, save the current coordinate position as our 'firstCorner'.
    - Every time we see that color and the next index is a different one, we save its position as our 'lastCorner'
    - From that, we can determine the center and size.
*/

const { Parser } = require('htmlparser2')
const Fs = require('fs/promises')
const Path = require('path')
const ImageWrapper = require('./ImageWrapper')

const normalizePath = (path, parent = process.cwd()) => Path.isAbsolute(path) ? path : Path.join(parent, path)

const args = process.argv.slice(2).filter(o => !o.startsWith('-')).map(p => normalizePath(p))

const constants = {
  planetPath: [
    "worldGeneration",
    "celestialObject",
    "celestialObject",
    "celestialObject"
  ],
  colorKeyAttributeName: '__colorKey',
  multiplierAttributeName: '__imageScale',
  imagePathAttributeName: '__imagePath'
}

const arraysMatch = (left, right) =>
  left.findIndex((value, index) => right[index] !== value) == -1

const createParser = async (editCenter, editSize) => {
  let currentPlanet,
      currentSpace,
      lastTag,
      inPlanet

  const resolvePlanet = attributes => {
    let colorKey = attributes[constants.colorKeyAttributeName]

    if(!colorKey) {
      console.warn(`No color key for celestialObject of id "${attributes.id}", skipping`)
      return
    }

    let { img, colorBoxes, multiplier } = currentSpace,
        box = colorBoxes[colorKey],
        imageCenterCoords = [
          Math.floor(img.canvas.width / 2),
          Math.floor(img.canvas.height / 2)
        ]

    if(!box) {
      console.warn(`No color found for celestialObject of id "${attributes.id}" with colorKey of rgb(${colorKey})`)
      return
    }

    const getCelestialCoord = (index) => {
      let [ x, y ] = img.getCoords(index)

      return [
        (x - imageCenterCoords[0]) * multiplier,
        (y - imageCenterCoords[1]) * multiplier
      ]
    }

    let topLeft = getCelestialCoord(box.topLeft),
        // Shift towards the bottom right
        bottomRight = getCelestialCoord(box.bottomRight).map(c => c + parseInt(multiplier) ),
        width = Math.abs(bottomRight[0] - topLeft[0]),
        height = Math.abs(bottomRight[1] - topLeft[1])

    return {
      topLeft,
      bottomRight,
      width,
      height,
      id: attributes.id
    }
  }

  const resolveSpace = async (attributes) => {
    let out = {
      multiplier: attributes[constants.multiplierAttributeName] ?? 1,
      img: attributes[constants.imagePathAttributeName]
    }

    if(!out.img) {
      throw new Error(`No image path provided for celestialObject of id "${attributes.id}"`)
    } else {
      out.img = await openImage(normalizePath(out.img, Path.dirname(args[0]) ) )
      out.colorBoxes = parseImage(out.img)
    }

    return out
  }


  const handleEndPlanetChild = (name, tag) => {
    switch(name) {
      case 'center':
        if(lastTag == 'parent' && depth == 6)
          editCenter(tag, currentPlanet)
        break

      case 'size':
        if(depth == 5)
          editSize(tag, currentPlanet)
        break

      case 'celestialObject':
        currentPlanet = undefined
        inPlanet = false
    }
  }

  let depth = 0,
      currentOperation

  let addOperation = exec => {
    if(currentOperation) {
      currentOperation = currentOperation.then(exec)
    } else {
      currentOperation = exec()
    }

    currentOperation.catch(console.error)
  }

  let parser = new Parser({
    onopentag(name, attributes) {
      // currentPath.push(name)      
      addOperation(async () => {
        depth++

        if(inPlanet || name != 'celestialObject') {
          if(name != 'center')
            lastTag = name

          return
        }

        switch(depth) {
          case 3:
            currentSpace = await resolveSpace(attributes)
            break

          case 4:
            currentPlanet = await resolvePlanet(attributes)
            inPlanet = true
            break
        }
      })
      // if(
      //   !currentPlanet &&
      //   currentPath.length == constants.planetPath.length &&
      //   arraysMatch(, constants.planetPath)
      // ) {
      //   currentPlanet = resolvePlanet(attributes[constants.colorKeyAttributeName], attributes.id)
      // } else if(name == 'worldGeneration') {
      //   multiplier = attributes[constants.multiplierAttributeName] || 1
      // }
    },

    onclosetag(name) {
      let tag = {
        start: parser.openTagStart + 0,
        end: parser.endIndex + 1
      }

      addOperation(() => {
        if(currentSpace) {
          if(inPlanet) {
            if(currentPlanet)
              handleEndPlanetChild(name, tag, currentPlanet)
          } else if(name == 'size') {
            let { img, multiplier } = currentSpace

            editSize(tag, {
              width: img.canvas.width * multiplier,
              height: img.canvas.height * multiplier
            })
          }
        }
        
        depth--
      })
      // currentPath.pop()
    }
  }, {
    xmlMode: true
  })

  return {
    parser,
    getCurrentOperation() {
      return currentOperation
    }
  }
}


const parseImage = (img) => {
  let colorBoxes = new Map(),
      lastColor

  img.forEach((rawColor, index, imageData) => {
    let color = rawColor.slice(0, 3).join()

    if(color != lastColor) {
      // Falling edge
      if(colorBoxes[lastColor] ) {
        colorBoxes[lastColor] = {
          bottomRight: index - 1,
          topLeft: colorBoxes[lastColor].topLeft
        }
      }
      
      // Rising edge
      if(!colorBoxes[color]) {
        colorBoxes[color] = {
          topLeft: index
        }
      }
    }

    lastColor = color
  })

  return colorBoxes
}

const openImage = path =>
  ImageWrapper.open(path)

const main = async () => {
  let xml = await Fs.readFile(args[0], { encoding: 'utf-8' }),
      replacements = []

  const addReplacement = (start, end, string) => {
    replacements.push({
      start, end, string
    })
  }

  const replaceCoordTag = (tag, name, coords) =>
    addReplacement(
      tag.start,
      tag.end,
      `<${name} x="${coords[0]}" z="${coords[1]}" />`
    )

  const editCenter = (tag, planet) => {
    let centerCoord = [
      planet.topLeft[0] + Math.floor(planet.width / 2),
      planet.topLeft[1] + Math.floor(planet.height / 2)
    ]

    replaceCoordTag(tag, 'center', centerCoord)
  }

  const editSize = (tag, planet) => {
    console.log(planet)
    
    replaceCoordTag(tag, 'size', [ planet.width, planet.height ])
  }

  let { getCurrentOperation, parser } = await createParser(editCenter, editSize)
  parser.write(xml)
  parser.end()
  await getCurrentOperation()

  let lastIndex = 0

  let editedXml = replacements.reduce((out, replacement) => {
    out += xml.slice(lastIndex, replacement.start) + replacement.string
    lastIndex = replacement.end
    
    return out
  }, '')
    + xml.slice(lastIndex)

  let out = args[1]

  if(process.argv.findIndex(o => o == '-o') != -1)
    out = args[0]

  await Fs.writeFile(out, editedXml)
}

main().then(() => console.log('Done!'))