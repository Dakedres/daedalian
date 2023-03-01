let Path = require('path'),
    FS = require('fs/promises')

import { isAbsolute } from 'path'
import Ronin from '/home/dakedres/Projects/Node/ronin/src/cli/Client.js'

let getPlanets = require('/home/dakedres/.local/share/multimc/instances/Daedalian2/.minecraft/config/cofh/world/helpers.dev/generator.js')
let textureGenerator = await FS.readFile(Path.join(__dirname, 'ore.lisp'), { encoding: "utf-8" })
let textureSettings = require('./textureSettings.js')
let stageAliases = require('./stageAliases.json')

const createPath = (subdir, ...nameParts) => {
  Path.isAbsolute(subdir)
  console.log("🚀 ~ file: create.js:13 ~ createPath ~ Path.isAbsolute(subdir)", Path.isAbsolute(subdir))

  let dir = Path.isAbsolute(subdir) ? subdir : Path.join(__dirname, subdir)

  return Path.join(dir, nameParts.join('_') + '.png')
}

const insureDir = async (path) => {
  let dir = Path.dirname(path)
  console.log("🚀 ~ file: create.js:19 ~ insureDir ~ dir", dir)

  

  try {
    await FS.access(dir)
  } catch(e) {
    await FS.mkdir(dir, { recursive: true })
  }
}

let [ assetDirPath, scriptDirPath ] = process.argv.slice(2).map(path => Path.isAbsolute(path) ? path : Path.join(process.cwd(), path))

let main = async oreDump => {
  let ctLines = []
  let oreDictLines = []
  let itemStageLines = []
  let langLines = []

  for(let planetName in oreDump) {
    let stonePath = Path.join(__dirname, 'stones', planetName + '.png')
  
    for(let oreName in oreDump[planetName]) {
      // console.log(oreName)

      // let oreName = planet.populate[oreName].generator
  
      // console.log(oreName)

      // if(!oreName || oresCreated.includes(oreName) )
      //   continue

  
      // let ore = planet.populate[featureName]
      let textureName = oreDump[planetName][oreName]?.textureName ?? oreName
      let capitalizedOreName = oreName[0].toUpperCase() + oreName.slice(1)
      let oreTextureSettings = textureSettings[textureName]
  
      console.log(`Generating "${oreName}" ore textures for planet "${planetName}", using texture "${textureName}"`)

      let oreOverlayPath = createPath('overlays', textureName)
      let shadowOverlayPath = createPath('overlays', oreTextureSettings.shape, 'shadow')
      let lightOverlayPath = createPath('overlays', oreTextureSettings.shape, 'light')
      let outPath = createPath(Path.join(assetDirPath, 'contenttweaker/textures/blocks'), planetName, oreName)

      await insureDir(outPath)

      let ronin = new Ronin(__dirname)
  
      await ronin.run([
        stonePath,
        shadowOverlayPath,
        oreOverlayPath,
        lightOverlayPath,
        oreTextureSettings.shadowIntensity,
        oreTextureSettings.lightIntensity,
        outPath
      ], textureGenerator)

      let blockName = planetName + '_' + oreName,
          blockItem = `<contenttweaker:${blockName}>`

      ctLines.push(`createOre(${JSON.stringify(blockName)}, 0);`)
      oreDictLines.push(`<ore:ore${capitalizedOreName}>.add(${blockItem});`)
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
  
  let langOutPath = Path.join(assetDirPath, 'contenttweaker/lang/en_US.lang')

  await insureDir(langOutPath)
  await FS.writeFile(langOutPath, langLines.join('\n'))

  await FS.writeFile(Path.join(scriptDirPath, 'ores.zs'), `
#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import crafttweaker.oredict.IOreDictEntry;
import mods.contenttweaker.ResourceLocation;
import crafttweaker.game.IGame;

function createOre(name as string, toolLevel as int) {
  var ore = VanillaFactory.createBlock(name, <blockmaterial:rock>);
  ore.setBlockResistance(6.0);
  ore.setToolClass("pickaxe");
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