
import mods.nuclearcraft.AlloyFurnace;
import mods.nuclearcraft.Crystallizer;

// Makes IE steel processing too obselete
AlloyFurnace.removeRecipeWithOutput(<ore:ingotSteel>);

// Recycling 
Crystallizer.addRecipe(<fluid:creosote> * 1000, <nuclearcraft:dust:8>);

// Can only be scavenged
recipes.remove(<matteroverdrive:pattern_drive>);
recipes.remove(<matteroverdrive:hc_battery>);