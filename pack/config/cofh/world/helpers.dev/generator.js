let toCreate = require('./targets')

function clone(obj) {
  let copy

  // Handle the 3 simple types, and null or undefined
  if (null == obj || "object" != typeof obj) return obj

  // Handle Date
  if (obj instanceof Date) {
      copy = new Date()
      copy.setTime(obj.getTime())
      return copy
  }

  // Handle Array
  if (obj instanceof Array) {
      copy = []
      for (var i = 0, len = obj.length; i < len; i++) {
          copy[i] = clone(obj[i])
      }
      return copy
  }

  // Handle Object
  if (obj instanceof Object) {
      copy = {}
      for (var attr in obj) {
          if (obj.hasOwnProperty(attr)) copy[attr] = clone(obj[attr])
      }
      return copy
  }

  throw new Error("Unable to copy object! Its type isn't supported.")
}

const FS = require('fs/promises'),
      Path = require('path')

let minecraftOres = require('../00_minecraft.json'),
    overworldOres = require('../01_overworld.json'),
    templateOres = require('./templates.json')

let oreTemplates = Object.assign(
  minecraftOres.populate,
  Object.assign(overworldOres.populate, templateOres.populate) 
)

let oreDump = {}

const merge = function self (...objects) {
  let [ left, right ] = objects
  
  right = { ...right } // Prevent overwriting source

  for(const key in right) {
    const source = right[key],
          target = left[key]

    if(target && source instanceof Object && target instanceof Object)
      right[key] = self(target, source)
  }

  const output = Object.assign(left, right)

  if(objects.length > 2) {
    return self(output, ...objects.slice(2))
  } else {
    objects[0] = output
    return output
  }
}

const translateHeight = function(height) {
  return Math.ceil( ( ( height / 62 ) * this.sealevel ) / 5 ) * 5
}

const getOreBlocks = (oreName, planet, template) => {
  const resolveOre = templateOre => {
    let templateName = templateOre['__ore-name'],
        newName = templateName ?? oreName,
        name = `contenttweaker:${planet.namespace}_${newName}`

    let planetDump = oreDump[planet.namespace]

    if(!planetDump)
      planetDump = oreDump[planet.namespace] = {
        stage: planet.stage ?? true,
        ores: {}
      }

    planetDump.ores[newName] = { textureName: templateOre['__texture-name'] }

    return templateOre['weight'] ? { name, weight: templateOre['weight'] } : { name }
  }

  if(template == undefined)
    throw new Error(`No ore template "${oreName}"`)

  if(Array.isArray(template.generator.block) ) {
    return template.generator.block.map(resolveOre)
  } else {
    return resolveOre(template.generator.block)
  }
}

const createOres = planet => {
  let out = {}

  for(let oreName in planet.ores) {
    let overrides = planet.ores[oreName],
        template = oreTemplates[oreName],
        templateCopy = clone(template),
        inferredOverrides = {
          generator: {
            block: getOreBlocks(oreName, planet, template),
            material: planet.stone
          },
          dimension: {
            restriction: "whitelist",
            value: [ planet.dimension ]
          }
        }

    if(template.distribution == 'cluster' && planet.sealevel && planet.sealevel != 62) {
      let getHeight = translateHeight.bind(planet)

      inferredOverrides['min-height'] = getHeight(template['min-height'])
      inferredOverrides['max-height'] = getHeight(template['max-height'])
    }

    // Prevent nasty interference when we merge
    templateCopy.generator.block = Array.isArray(inferredOverrides.generator.block) ? [] : {}
    
    out[oreName] = merge(templateCopy, inferredOverrides, overrides)
  }

  return out
}

module.exports = async () => {
  for(let planet of toCreate) {
    let data = {
      namespace: planet.namespace,
      populate: createOres(planet)
    }
  
    if(planet.overrides)
      data = merge(data, planet.overrides)
  
    let path = Path.join(
      __dirname,
      '../',
      `${planet.number.toString().padStart(2, '0')}_${planet.namespace}.json`
    )
  
    await FS.writeFile(path, JSON.stringify(data, null, 2) )
  }

  console.log(oreDump)

  return oreDump
}