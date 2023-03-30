const defaultNameMapper = (mod, name, meta) =>
  name[0].toUpperCase() + name.slice(1).replaceAll('_', ' ')

const forTiles = (
  items,
  textureMapper,
  nameMapper = defaultNameMapper,
  multiplier,
  hardness,
  resistance
) =>
  items.map(tile => {
    let parts = tile.split(':')

    return {
      tile,
      texture: textureMapper(...parts),
      name: nameMapper(...parts),
      multiplier,
      hardness,
      resistance
    }
  })

module.exports = [
  ...forTiles([
    'xtones:kryp:2',
    'xtones:tank:3',
    'xtones:reds:1',
    'xtones:vect:11',
    'xtones:vena:11',
    'xtones:jelt:9',
    'xtones:sync:6',
    'xtones:reed:1',
    'xtones:lave:7',
    'xtones:lair:14',
    'xtones:korp:9',
    'xtones:mint:11',
    'xtones:roen:14',
    'xtones:sols:3',
    'xtones:azur:4',
  ], (mod, name, meta) => {
    return `${mod}:blocks/${name}/${meta}`
  }),
  {
    tile: 'matteroverdrive:machine_hull',
    texture: 'matteroverdrive:blocks/base',
    name: 'Tritanium'
  }
  // ...forTiles([
  //   'matteroverdrive:machine_hull'
  // ])
]

console.log(module.exports)