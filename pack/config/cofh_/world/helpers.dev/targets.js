let noHeightRestriction = {
  'min-height': 0,
  'max-height': 255
}

let glacidusMiddle = {
  'min-height': 32,
  'max-height': 72
}

const oreDistribution = (count, size, otherOverrides) => {
  let overrides = {}

  if(count)
    overrides['cluster-count'] = count

  if(size)
    overrides['generator'] = { 'cluster-size': size }

  if(otherOverrides)
    overrides = Object.assign(overrides, otherOverrides)

  return overrides
}

module.exports = [
  {
    number: 4,
    dimension: -1005,
    namespace: 'mercury',
    sealevel: 72,
    ores: {
      'titanium-cavewall': {},
    },
    stone: {
      name: 'galaxyspace:mercury_blocks',
      properties: {
        type: 'mercury_stone'
      }
    }
  },
  {
    number: 2,
    dimension: -29,
    namespace: 'mars',
    sealevel: 90,
    ores: {
      boron: oreDistribution(2),
      platinum: oreDistribution(6),
      uranium: oreDistribution(4, 2)
    },
    stone: {
      name: "galacticraftplanets:mars",
      properties: {
        "basictypemars": "mars_stone"
      }
    }
  },
  {
    number: 5,
    dimension: -30,
    namespace: 'sol_asteroids',
    ores: {
      lithium: noHeightRestriction,
      nickel: noHeightRestriction,
      tungsten: noHeightRestriction
    },
    stone: {
      name: "galacticraftplanets:asteroids_block",
      properties: {
        "basictypeasteroids": "asteroid_rock_0"
      }
    }
  },
  {
    number: 6,
    dimension: -31,
    namespace: 'venus',
    ores: {
      magnesium: oreDistribution(4),
      zinc: {
        'max-height': 58
      }
    },
    stone: {
      name: "galacticraftplanets:venus",
      properties: {
        "basictypevenus": "venus_rock_1"
      }
    }
  },
  {
    number: 7,
    dimension: 69,
    namespace: 'mist_up',
    ores: {
      'copper-edge': {},
    },
    stone: "mist:stone"
  },
  {
    number: 8,
    dimension: 69,
    namespace: 'mist_down',
    ores: {
      'fluorite-cave': {},
      boron: oreDistribution(2),
      'uranium-cave': {},
      thorium: oreDistribution(1)
    },
    stone: "mist:stone_porous"
  },
  {
    number: 9,
    dimension: 84,
    namespace: 'glacidus_middle',
    ores: {
      boron: oreDistribution(1, 4, glacidusMiddle),
      'silver-and-lead': oreDistribution(4, 6, glacidusMiddle),
      'gold-cave': {}
    },
    stone: "glacidus:frozen_antinatric_stone"
  },
  {
    number: 10,
    dimension: 84,
    namespace: 'glacidus_bottom',
    ores: {
      redstone: {
        'max-height': 15
      },
      'quartz': oreDistribution(15, 2, {
        'min-height': 18,
        'max-height': 30,
        'chunk-chance': 2
      })
    },
    stone: "glacidus:thawed_antinatric_stone"
  },
  {
    number: 11,
    dimension: -1025,
    namespace: "proxima_b",
    sealevel: 72,
    ores: {
      nickel: oreDistribution(3),
      tungsten: oreDistribution(2, 4),
      thorium: oreDistribution(3),
      platinum: oreDistribution(2, 8)
      // coal: oreDistribution(30, 2, {
      //   'min-height': 60,
      //   'max-height': 75
      // })
    },
    stone: {
      name: "galaxyspace:proxima_b_blocks",
      properties: {
        "type": "proxima_b_stone"
      }
    }
  },
  {
    number: 12,
    dimension: -1030,
    namespace: "barnarda_c",
    ores: {
      uranium: {},
      thorium: {},
      boron: oreDistribution(5),
      'silver-and-lead': oreDistribution(2),
      'lead-and-silver': oreDistribution(2),
      salt: {},
      'titanium': {}
    }
  },
  {
    number: 13,
    dimension: 2000,
    namespace: "defiled",
    ores: {
      zinc: {},
      'fluorite-cave': {
        'ground-level': 60
      },
      'tin': {},
      'coal': {},
      'quartz': {
        'min-height': 0,
        'max-height': 10
      }
    }
  }
]