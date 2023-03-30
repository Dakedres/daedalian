const FS = require('fs/promises')
const Path = require('path')
const data = require('./data.js')

const [ containersDir, assetDir ] = process.argv.slice(2).map(path => Path.isAbsolute(path) ? path : Path.join(process.cwd(), path))

const insureDir = async (path) => {
  let dir = Path.dirname(path)

  try {
    await FS.access(dir)
  } catch(e) {
    await FS.mkdir(dir, { recursive: true })
  }
}

const safeWriteFile = async (path, data) => {
  await insureDir(path)
  return await FS.writeFile(path, data)
}

let lang = ''

for(let {
  tile,
  texture,
  name,
  multiplier = 1,
  hardness = 2,
  resistance = 10
} of data) {
  let subid = tile.replaceAll(':', '_')

  let cfg = `\
Chimney {

    CraftingRecipe {

        main {
            I:amount=${parseInt(8 * multiplier)}

            S:components <
                ${tile}
              >
            
            S:output=adchmineys:${subid}:1

            S:pattern=101 101 101
        }

    }

}


Pump {

    CraftingRecipe {

        main {
            I:amount=4
            
            S:components <
                adchimneys:${subid}:1
                repeater
                blockCoal
              >

            S:output=adchimneys:${subid}:2

            S:pattern=121 232 121
        }

    }

}


Vent {

    CraftingRecipe {

        main {
            I:amount=4

            S:components <
                adchimneys:${subid}
              >

            S:output=adchimneys:${subid}:1

            S:pattern=101 000 101
        }

    }

}


${tile.split(':').slice(0, 2).join(':')} {
    S:color=0x11C0AA72

    B:enabled=true

    S:hardness=${hardness}

    S:relatedBlockId=${tile}

    S:resistance=10.0
}  
`

  let blockstate = {
    "forge_marker": 1,
    "defaults": {
      "transform": "forge:default-block",
      "textures": {
        "0": texture,
        "particle": "#0"
      }
    },
    "variants": {
      "type": {
        "chimney": {
          "model": "adchimneys:chimney"
        },
        "vent": {
          "model": "adchimneys:vent"
        },
        "pump": {
          "model": "adchimneys:pump"
        }
      },
      "inventory": [
        {}
      ]
    }
  }

  await safeWriteFile(Path.join(containersDir, subid + '.cfg'), cfg)
  await safeWriteFile(Path.join(assetDir, 'blockstates', subid + '.json'), JSON.stringify(blockstate, null, 2) )

  lang += `\
tile.${subid}.chimney.name=${name} Chimney
tile.${subid}.vent.name=${name} Vent
tile.${subid}.pump.name=${name} Pump
`
}

await safeWriteFile(Path.join(assetDir, 'lang', 'en_us.lang'), lang)

console.log('Done!')