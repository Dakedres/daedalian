import mods.immersiveengineering.Blueprint;

recipes.addShapeless(<immersiveengineering:blueprint>.withTag({blueprint: "high_pressure_alloy"}), [
  <minecraft:paper>,
  <galacticraftplanets:schematic:0>.reuse()
]);
Blueprint.addRecipe('high_pressure_alloy', <galaxyspace:compressed_plates:4>, [
  <ore:plateAluminum>,
  <galacticraftcore:basic_item:10>,
  <galaxyspace:compressed_plates>
]);

recipes.addShapeless(<immersiveengineering:blueprint>.withTag({blueprint: "sync_core"}), [
  <minecraft:paper>,
  <galacticraftplanets:schematic:1>.reuse()
]);
Blueprint.addRecipe('sync_core', <sync:item_placeholder>, [
  <ore:gemDilithium>,
  <ore:gemDilithium>,
  <ore:gemDilithium>,
  <ore:gemDilithium>,
  <ore:blockLapis>,
  <minecraft:ender_eye>
]);

recipes.addShapeless(<immersiveengineering:blueprint>.withTag({blueprint: "sync_core"}), [
  <minecraft:paper>,
  <galaxyspace:rocket_modules:8>.reuse()
]);
Blueprint.addRecipe('sync_core', <sync:item_placeholder>, [
  <ore:gemDilithium>,
  <ore:gemDilithium>,
  <ore:gemDilithium>,
  <ore:gemDilithium>,
  <ore:blockLapis>,
  <minecraft:ender_eye>
]);
