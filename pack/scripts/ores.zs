#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import crafttweaker.oredict.IOreDictEntry;
import mods.contenttweaker.ResourceLocation;
import crafttweaker.game.IGame;

function createOre(prefix as string, name as string, toolLevel as int, oreDict as IOreDictEntry) {
  var ore = VanillaFactory.createBlock(prefix ~ "_" ~ name, <blockmaterial:rock>);
  ore.setBlockResistance(6.0);
  ore.setToolClass("pickaxe");
  ore.setToolLevel(toolLevel);
  ore.register();

  print("contenttweaker:" ~ name );
  oreDict.add(itemUtils.getItem("contenttweaker:" ~ name) );
}

createOre("mercury", "titanium", 0, <ore:oreTitanium>);
createOre("mars", "boron", 0, <ore:oreBoron>);
createOre("mars", "platinum", 0, <ore:orePlatinum>);
createOre("mars", "uranium", 0, <ore:oreUranium>);
createOre("sol_asteroids", "lithium", 0, <ore:oreLithium>);
createOre("sol_asteroids", "nickel", 0, <ore:oreNickel>);
createOre("sol_asteroids", "tungsten", 0, <ore:oreTungsten>);
createOre("venus", "zinc", 0, <ore:oreZinc>);
createOre("mist_up", "copper", 0, <ore:oreCopper>);
createOre("mist_down", "fluorite", 0, <ore:oreFluorite>);
createOre("mist_down", "boron", 0, <ore:oreBoron>);
createOre("mist_down", "uranium", 0, <ore:oreUranium>);
createOre("mist_down", "thorium", 0, <ore:oreThorium>);
createOre("glacidus_middle", "boron", 0, <ore:oreBoron>);
createOre("glacidus_middle", "silver", 0, <ore:oreSilver>);
createOre("glacidus_middle", "lead", 0, <ore:oreLead>);
createOre("glacidus_middle", "gold", 0, <ore:oreGold>);
createOre("glacidus_bottom", "redstone", 0, <ore:oreRedstone>);
createOre("proxima_b", "nickel", 0, <ore:oreNickel>);
createOre("proxima_b", "tungsten", 0, <ore:oreTungsten>);
createOre("proxima_b", "thorium", 0, <ore:oreThorium>);
createOre("proxima_b", "platinum", 0, <ore:orePlatinum>);
createOre("barnarda_c", "uranium", 0, <ore:oreUranium>);
createOre("barnarda_c", "thorium", 0, <ore:oreThorium>);
createOre("barnarda_c", "boron", 0, <ore:oreBoron>);
createOre("barnarda_c", "silver", 0, <ore:oreSilver>);
createOre("barnarda_c", "lead", 0, <ore:oreLead>);
createOre("barnarda_c", "salt", 0, <ore:oreSalt>);
createOre("barnarda_c", "titanium", 0, <ore:oreTitanium>);
createOre("defiled", "zinc", 0, <ore:oreZinc>);
createOre("defiled", "fluorite", 0, <ore:oreFluorite>);
createOre("defiled", "tin", 0, <ore:oreTin>);
createOre("defiled", "coal", 0, <ore:oreCoal>);