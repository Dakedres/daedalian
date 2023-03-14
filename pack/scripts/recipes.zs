recipes.remove(<adminshop:shop>);
recipes.addShaped(<adminshop:shop>, [
  [ null, <ore:blockGlass>, null ],
  [ <refinedstorage:core>, <contenttweaker:interdimensional_core>, <refinedstorage:core:1> ],
  [ <ore:ingotIron>,  <ore:ingotIron>, <ore:ingotIron> ],
]);

recipes.remove(<adminshop:atm>);
recipes.addShaped(<adminshop:atm>, [
  [ null, <ore:blockGlass>, null ],
  [ <ore:ingotIron>, <contenttweaker:interdimensional_core>, <ore:ingotIron> ],
  [ <ore:ingotIron>,  <ore:ingotIron>, <ore:ingotIron> ],
]);

recipes.remove(<adminshop:seller>);
recipes.addShaped(<adminshop:seller>, [
  [ null, <minecraft:hopper>, null ],
  [ <minecraft:redstone_block>, <contenttweaker:interdimensional_core>, <minecraft:bucket> ],
  [ <ore:ingotIron>,  <refinedstorage:core:1>, <ore:ingotIron> ],
]);

recipes.addShapeless(<minecraft:compass>.withTag({
  RepairCost: 0,
  giacomosbussolaID: 1678126769228 as long,
  display: {Name: "Inner Sol"},
  giacomosbussolaY: 0 as float,
  giacomosbussolaZ: 0 as float,
  giacomosbussolaX: 0 as float
}), [
  <minecraft:paper>, <minecraft:compass>
]);