
import mods.nuclearcraft.AlloyFurnace;
import mods.nuclearcraft.Crystallizer;
import mods.immersiveengineering.Crusher;

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

// Xtones tile from asphalt
recipes.addShaped(<xtones:base> * 14, [
  [ <immersivepetroleum:stone_decoration>, <immersivepetroleum:stone_decoration> ],
  [ <immersivepetroleum:stone_decoration>, <minecraft:stone>, <immersivepetroleum:stone_decoration> ],
  [ null, <immersivepetroleum:stone_decoration>, <immersivepetroleum:stone_decoration> ]
]);

// Insulate mv with bitumen & 1 rubber strap
recipes.addShaped(<immersiveengineering:wirecoil:7> * 4, [
  [ <immersiveengineering:wirecoil:1>, <immersivepetroleum:material>, <immersiveengineering:wirecoil:1> ],
  [ <immersivepetroleum:material>, <immersiveintelligence:material:29>, <immersivepetroleum:material> ],
  [ <immersiveengineering:wirecoil:1>, <immersivepetroleum:material>, <immersiveengineering:wirecoil:1> ]
]);

// Treated wood directly from logs
recipes.addShapeless(<immersiveengineering:treated_wood> * 8, [
  <forge:bucketfilled>.withTag({FluidName: "creosote", Amount: 1000}),
  <ore:logWood>,
  <ore:logWood>
]);

// Treated sticks directly from logs
recipes.addShapedMirrored("treated_sticks_from_logs_t", <immersiveengineering:material> * 32, [
  [ <ore:logWood>, <forge:bucketfilled>.withTag({FluidName: "creosote", Amount: 1000}) ],
  [ <ore:logWood> ]
]);

recipes.addShapedMirrored("treated_sticks_from_logs_b", <immersiveengineering:material> * 32, [
  [ <ore:logWood> ],
  [ <ore:logWood>, <forge:bucketfilled>.withTag({FluidName: "creosote", Amount: 1000}) ]
]);

for i in 1 .. 15 {
	val wool = itemUtils.getItem("minecraft:wool", i);
  // Just why. Why are they inversed
  val dye = itemUtils.getItem("minecraft:dye", 15 - i);

  Crusher.removeRecipesForInput(wool);
  Crusher.addRecipe(<minecraft:string> * 4, wool, 2048, dye, 0.8);
}

// I don't know why tritanium doesn't have ore doubling but whatever
// Byproduct is phosphorous
Crusher.addRecipe(<matteroverdrive:tritanium_dust> * 2, <ore:oreTritanium>, 2048, <immersiveintelligence:material_dust:9>, 0.15);

// Niobium gives sodium nitrate byproduct
Crusher.removeRecipe(<qmd:dust:1>);
Crusher.addRecipe(<qmd:dust:1> * 2, <ore:oreNiobium>, 2048, <immersiveengineering:material:24>, 0.10);

// Lithium gives aluminum byproduct
Crusher.removeRecipe(<nuclearcraft:dust:6>);
Crusher.addRecipe(<nuclearcraft:dust:6> * 2, <ore:oreLithium>, 2048, <immersiveengineering:metal:10>, 0.10);

// Thorium gives Zirconium byproduct
Crusher.removeRecipe(<nuclearcraft:dust:3>);
Crusher.addRecipe(<nuclearcraft:dust:3>* 2, <ore:oreThorium>, 2048, <nuclearcraft:dust:10>, 0.10);