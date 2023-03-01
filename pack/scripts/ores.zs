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

createOre("mercury_titanium", 0);
createOre("mars_boron", 0);
createOre("mars_platinum", 0);
createOre("mars_uranium", 0);
createOre("sol_asteroids_lithium", 0);
createOre("sol_asteroids_nickel", 0);
createOre("sol_asteroids_tungsten", 0);
createOre("venus_magnesium", 0);
createOre("venus_zinc", 0);
createOre("mist_up_copper", 0);
createOre("mist_down_fluorite", 0);
createOre("mist_down_boron", 0);
createOre("mist_down_uranium", 0);
createOre("mist_down_thorium", 0);
createOre("glacidus_middle_boron", 0);
createOre("glacidus_middle_silver", 0);
createOre("glacidus_middle_lead", 0);
createOre("glacidus_middle_gold", 0);
createOre("glacidus_bottom_redstone", 0);
createOre("glacidus_bottom_quartz", 0);
createOre("proxima_b_nickel", 0);
createOre("proxima_b_tungsten", 0);
createOre("proxima_b_thorium", 0);
createOre("proxima_b_platinum", 0);
createOre("barnarda_c_uranium", 0);
createOre("barnarda_c_thorium", 0);
createOre("barnarda_c_boron", 0);
createOre("barnarda_c_silver", 0);
createOre("barnarda_c_lead", 0);
createOre("barnarda_c_salt", 0);
createOre("barnarda_c_titanium", 0);
createOre("defiled_zinc", 0);
createOre("defiled_fluorite", 0);
createOre("defiled_tin", 0);
createOre("defiled_coal", 0);
createOre("defiled_quartz", 0);