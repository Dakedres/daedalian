let Path = require('path'),
    FS = require('fs/promises')

import Ronin from '/home/dakedres/Projects/Node/ronin/src/cli/Client.js'

let getPlanets = require('/home/dakedres/.local/share/multimc/instances/Daedalian2/.minecraft/config/cofh/world/helpers.dev/generator.js')
let textureGenerator = await FS.readFile(Path.join(__dirname, 'ore.lisp'), { encoding: "utf-8" })
let textureSettings = require('./textureSettings.js')
let stageAliases = require('./stageAliases.json')

const createPath = (subdir, ...nameParts) => {
  Path.isAbsolute(subdir)

  let dir = Path.isAbsolute(subdir) ? subdir : Path.join(__dirname, subdir)

  return Path.join(dir, nameParts.join('_') + '.png')
}

const access = async (path) => {
  try {
    await FS.access(path)
    return true
  } catch(e) {
    return false
  }
}

const insureDir = async (path) => {
  let dir = Path.dirname(path)

  try {
    await FS.access(dir)
  } catch(e) {
    await FS.mkdir(dir, { recursive: true })
  }
}

let [ assetDirPath, scriptDirPath ] = process.argv.slice(2).map(path => Path.isAbsolute(path) ? path : Path.join(process.cwd(), path))

let main = async oreDump => {
  let allOresDump = Object.assign(oreDump, require('./extraGroups.js'))

  let ctLines = []
  let oreDictLines = []
  let itemStageLines = []
  let langLines = []

  for(let planetName in allOresDump) {
    let stonePath = Path.join(__dirname, 'stones', planetName + '.png')
  
    for(let oreName in allOresDump[planetName].ores) {
      // console.log(oreName)

      // let oreName = planet.populate[oreName].generator
  
      // console.log(oreName)

      // if(!oreName || oresCreated.includes(oreName) )
      //   continue

  
      // let ore = planet.populate[featureName]
      let planet = allOresDump[planetName]
      let ore = planet.ores[oreName]
      let capitalizedOreName = oreName[0].toUpperCase() + oreName.slice(1)

      if(ore.render ?? true) {
        let textureName = ore.textureName ?? oreName
        let oreTextureSettings = textureSettings[textureName]
    
        console.log(`Generating "${oreName}" ore textures for planet "${planetName}", using texture "${textureName}"`)

        let oreOverlayPath = createPath('overlays', textureName)
        let shadowOverlayPath = createPath('overlays', oreTextureSettings.shape, 'shadow')
        let lightOverlayPath = createPath('overlays', oreTextureSettings.shape, 'light')
        let outPath = createPath(Path.join(assetDirPath, 'contenttweaker/textures/blocks'), planetName, oreName)

        // Instantiate it for each texture or else we're just generating our textures over the old ones 
        let ronin = new Ronin(__dirname)

        await insureDir(outPath)        
        await ronin.run([
          stonePath,
          shadowOverlayPath,
          oreOverlayPath,
          lightOverlayPath,
          oreTextureSettings.shadowIntensity,
          oreTextureSettings.lightIntensity,
          outPath
        ], textureGenerator)
      }

      let blockName = planetName + '_' + oreName,
          blockItem = `<contenttweaker:${blockName}>`

      ctLines.push(`createOre(${JSON.stringify(blockName)}, 2);`)
      oreDictLines.push(`<ore:ore${capitalizedOreName}>.add(${blockItem});`)
      if(planet.stage)
        itemStageLines.push(`ItemStages.addItemStage(${JSON.stringify(stageAliases[planetName] || planetName)}, ${blockItem});`)

      langLines.push(`tile.contenttweaker.${blockName}.name=${capitalizedOreName} Ore`)

      // ChildProcess.exec(`
      // ffmpeg
      //   -i ${stonePath}
      //   -colorspace 1
      //   -i ${overlaysPath}
      //   -colorspace 1
      //   -filter_complex "[0][1] overlay" ${out} -y
      // `.replaceAll('\n', ''),
      //   (error, stdout, stderr) => {
      //   console.log('h')
        
      //   if (error) {
      //     console.error(`exec error: ${error}`);
      //     return;
      //   }
      //   console.log(`stdout: ${stdout}`);
      //   console.error(`stderr: ${stderr}`);
      // })
  
    }
  }
  
  let langOutPath = Path.join(assetDirPath, 'contenttweaker/lang/en_us.lang')
  let langData = langLines.join('\n')

  if(await access(langOutPath) ) {
    let data = await FS.readFile(langOutPath, { encoding: 'utf-8' })

    await FS.writeFile(langOutPath, data.trim() + '\n' + langData)
  } else {
    await insureDir(langOutPath)
    await FS.writeFile(langOutPath, langData)
  }



  await FS.writeFile(Path.join(scriptDirPath, 'ores.zs'), `
#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.ResourceLocation;
import crafttweaker.game.IGame;

function createOre(name as string, toolLevel as int) {
  var ore = VanillaFactory.createBlock(name, <blockmaterial:rock>);
  ore.setBlockResistance(6.0);
  ore.setToolClass("pickaxe");
  ore.setTranslucent(false);
  ore.setToolLevel(toolLevel);
  ore.register();
}
  `.trim() + '\n\n' + ctLines.join('\n'))

  await FS.writeFile(
    Path.join(scriptDirPath, 'ore_setup.zs'),
    'import mods.ItemStages;\n\n'
    + oreDictLines.join('\n')
    + '\n\n'
    + itemStageLines.join('\n')
  )

}

getPlanets()
  .then(main)
  .then(() => console.log('Done!'))
  .catch(console.error)