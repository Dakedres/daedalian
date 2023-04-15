
import mods.nuclearcraft.AlloyFurnace;
import mods.nuclearcraft.Crystallizer;

// Makes IE steel processing too obselete
AlloyFurnace.removeRecipeWithOutput(<ore:ingotSteel>);

// Recycling 
Crystallizer.addRecipe(<fluid:creosote> * 1000, <nuclearcraft:dust:8>);

// Can only be scavenged
recipes.remove(<matteroverdrive:pattern_drive>);
recipes.remove(<matteroverdrive:hc_battery>);

recipes.addShaped(<minecraft:stick> * 32, [
  [ <ore:logWood> ],
  [ <ore:logWood> ]
]);

recipes.remove(<warpdrive:ship_core.basic>);
recipes.addShaped(<warpdrive:ship_core.basic>, [
  [ <ore:dustRedstone>, <warpdrive:component:2> ],
  [ <warpdrive:component:20>, <ore:blockIron>, <ore:dustRedstone> ],
  [ <ore:dustRedstone>, <galacticraftcore:basic_item:14>, <warpdrive:component:0> ]
]);

recipes.remove(<warpdrive:ship_controller.basic>);
recipes.addShaped(<warpdrive:ship_controller.basic>, [
  [ <warpdrive:component:6>, <warpdrive:component:2> ],
  [ <minecraft:ender_pearl>, <ore:blockIron>, <warpdrive:component:6> ],
  [ <warpdrive:component:6>, <galacticraftcore:basic_item:14>, <warpdrive:component:0> ]
]);