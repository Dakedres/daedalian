import mods.immersiveengineering.Blueprint;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

function schematicConversion(name as string, baseSchematic as IIngredient) {
  recipes.addShapeless(<immersiveengineering:blueprint>.withTag({blueprint: name}), [
    <minecraft:paper>,
    baseSchematic.reuse()
  ]);
}

function createBlueprint(name as string, baseSchematic as IIngredient, result as IItemStack, items as IIngredient[]) {
  schematicConversion(name, baseSchematic);
  Blueprint.addRecipe(name, result, items);                               
}

recipes.remove(<sync:item_placeholder>);
createBlueprint('sync_core', <galacticraftcore:schematic:1>, <sync:item_placeholder>, [
  <ore:gemDilithium>,
  <ore:gemDilithium>,
  <ore:gemDilithium>,
  <ore:gemDilithium>,
  <ore:blockLapis>,
  <minecraft:ender_eye>
]);

createBlueprint('interdimensional_core', <galacticraftplanets:schematic>, <contenttweaker:interdimensional_core>, [
  <matteroverdrive:dilithium_crystal>,
  <warpdrive:component:6>
]);

mods.galaxyspace.removeAssemblyRecipe(<galaxyspace:compressed_plates:4>);
createBlueprint('high_pressure_alloy', <galaxyspace:rocket_modules:8>, <galaxyspace:compressed_plates:4>, [
  <ore:plateAluminum>,
  <galacticraftcore:basic_item:10>,
  <galaxyspace:compressed_plates>
]);


Blueprint.addRecipe('pendants', <artifacts:shock_pendant>, [
  <ore:wireElectrum>,
  <ore:wireElectrum>,
  <ore:wireElectrum>,
  <warpdrive:component:2>
]);

Blueprint.addRecipe('pendants', <artifacts:flame_pendant>, [
  <immersiveintelligence:material_wire>,
  <minecraft:blaze_powder>,
  <minecraft:blaze_powder>,
  <warpdrive:component:4>
]);

Blueprint.addRecipe('pendants', <artifacts:thorn_pendant>, [
  <ore:wireSteel>,
  <ore:materialRDX>,
  <ore:materialRDX>,
  <warpdrive:component:3>
]);

Blueprint.addRecipe('pendants', <artifacts:panic_necklace>, [
  <ore:wireElectrum>,
  <minecraft:ghast_tear>,
  <minecraft:ghast_tear>,
  <matteroverdrive:dilithium_crystal>
]);

schematicConversion('knockback_control', <galaxyspace:rocket_modules:9>);
Blueprint.addRecipe('knockback_control', <artifacts:cobalt_shield>, [
  <ore:ingotCobalt>,
  <ore:ingotCobalt>,
  <ore:ingotCobalt>,
  <ore:ingotMagnet>
]);

Blueprint.addRecipe('knockback_control', <artifacts:pocket_piston>, [
  <ore:blockSlime>,
  <minecraft:piston>
]);

Blueprint.addRecipe('cloud_jars', <artifacts:bottled_cloud>, [
  <forge:bucketfilled>.withTag({FluidName: "super_critical_steam", Amount: 1000}),
  <galacticraftcore:space_glass_vanilla>,
  <galacticraftcore:space_glass_vanilla>,
  <galacticraftcore:space_glass_vanilla>
]);

Blueprint.addRecipe('endless_food', <artifacts:everlasting_beef>, [ <ore:netherStar>, <minecraft:beef> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_chicken>, [ <ore:netherStar>, <minecraft:chicken> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_clownfish>, [ <ore:netherStar>, <minecraft:clownfish> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_cod>, [ <ore:netherStar>, <minecraft:cod> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_cooked_beef>, [ <ore:netherStar>, <minecraft:cooked_beef> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_cooked_chicken>, [ <ore:netherStar>, <minecraft:cooked_chicken> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_cooked_cod>, [ <ore:netherStar>, <minecraft:cooked_cod> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_cooked_mutton>, [ <ore:netherStar>, <minecraft:cooked_mutton> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_cooked_porkchop>, [ <ore:netherStar>, <minecraft:cooked_porkchop> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_cooked_rabbit>, [ <ore:netherStar>, <minecraft:cooked_rabbit> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_cooked_salmon>, [ <ore:netherStar>, <minecraft:cooked_salmon> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_mutton>, [ <ore:netherStar>, <minecraft:mutton> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_porkchop>, [ <ore:netherStar>, <minecraft:porkchop> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_rabbit>, [ <ore:netherStar>, <minecraft:rabbit> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_rabbit_stew>, [ <ore:netherStar>, <minecraft:rabbit_stew> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_rotten_flesh>, [ <ore:netherStar>, <minecraft:rotten_flesh> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_salmon>, [ <ore:netherStar>, <minecraft:salmon> ]);
Blueprint.addRecipe('endless_food', <artifacts:everlasting_spider_eye>, [ <ore:netherStar>, <minecraft:spider_eye> ]);

// recipes.addShapeless(<immersiveengineering:blueprint>.withTag({blueprint: "sync_core"}), [
//   <minecraft:paper>,
//   <galaxyspace:rocket_modules:8>.reuse()
// ]);
// Blueprint.addRecipe('sync_core', <sync:item_placeholder>, [
//   <ore:gemDilithium>,
//   <ore:gemDilithium>,
//   <ore:gemDilithium>,
//   <ore:gemDilithium>,
//   <ore:blockLapis>,
//   <minecraft:ender_eye>
// ]);
