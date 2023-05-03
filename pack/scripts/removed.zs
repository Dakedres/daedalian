import mods.jei.JEI;
import mods.ItemStages;
import crafttweaker.item.IItemStack;

val craftingToRemove = [
	<galacticraftplanets:mars_machine:4>,
  <galacticraftcore:engine>,
  <galacticraftcore:rocket_fins>,
  <galacticraftcore:nose_cone>,
  <galacticraftplanets:heavy_nose_cone>,
  <galacticraftplanets:item_basic_asteroids:2>,
  <galacticraftplanets:item_basic_asteroids:1>,
  <galacticraftcore:refinery>,
  <galaxyspace:fuel_generator>,
  <galacticraftcore:fuel_loader>,
  <galacticraftcore:collector>,
  <galacticraftcore:oxygen_compressor>,
  <galacticraftcore:distributor>,
  <galacticraftcore:oxygen_compressor:4>,
  <galacticraftcore:sealer>,
  <galacticraftcore:oxygen_detector>,
  <galacticraftcore:machine2:8>,
  <galacticraftcore:oxygen_mask>,
  <galacticraftcore:oxygen_gear>,
  <galacticraftcore:oxygen_tank_light_full>,
  <galacticraftcore:oxygen_tank_med_full>,
  <galacticraftcore:oxygen_tank_heavy_full>,
  <galaxyspace:oxygen_tank_4>,
  <galaxyspace:oxygen_tank_5>,
  <galaxyspace:oxygen_tank_6>,
  <galaxyspace:oxygen_tank_epp_1>,
  <galacticraftcore:landing_pad>,
  <galaxyspace:rocket_modules>,
  <galaxyspace:rocket_modules:1>,
  <galaxyspace:rocket_modules:2>,
  <galaxyspace:rocket_modules:3>,
  <galaxyspace:rocket_modules:4>,
  <galaxyspace:rocket_modules:5>,
  <galaxyspace:rocket_modules:6>,
  <galaxyspace:rocket_modules:7>,
  <galaxyspace:rocket_assembler>,
  <galacticraftplanets:grapple>,
   // Funky locomotion, transporters, short range teleporters, grappling hooks. It makes too many things obselete
  <galaxyspace:jetpack:77>,
  <warpdrive:component:31>,
  <warpdrive:component:32>,
  <refinedstorage:silicon>,
  // <portality:module_interdimensional>,
  // Misty world portal
  <mist:portal_base>,
  <mist:portal_base:1>,
  // Can be quite broken for PvP
  <galaxyspace:gs_basic:18>,
  // You shouldn't need to auto buy anything
  <adminshop:buyer>,
  // Too easy of wireless item transport
  <minecraft:ender_chest>,
  <nuclearcraft:portable_ender_chest>,
  // Promote other power gen
  <matteroverdrive:fusion_reactor_controller>,
  <matteroverdrive:fusion_reactor_coil>,
  <matteroverdrive:fusion_reactor_io>,
  // // Disabled already
  // <tesslocator:advanced_fluid_tesslocator>,
  // <tesslocator:advanced_item_tesslocator>,
  // Complicates things
  // <minecraft:enchanting_table>,
  // <minecraft:enchanted_book>,
  // The WarpDrive system for this has far more depth
  <matteroverdrive:transporter>,
  // Makes LV, MV, HV, ect. obselete
  <galacticraftcore:aluminum_wire>,
  <galacticraftcore:aluminum_wire:1>
] as IItemStack[];


for item in craftingToRemove {
  JEI.removeAndHide(item);
  ItemStages.addItemStage("disabled", item);
}

val toHide = [
  <minecraft:spawn_egg>,
  <galacticraftcore:rocket_t1>,
  <galacticraftcore:rocket_t1:1>,
  <galacticraftcore:rocket_t1:2>,
  <galacticraftcore:rocket_t1:3>,
  <galacticraftcore:rocket_t1:4>,
  <galacticraftplanets:rocket_t2>,
  <galacticraftplanets:rocket_t2:1>,
  <galacticraftplanets:rocket_t2:2>,
  <galacticraftplanets:rocket_t2:3>,
  <galacticraftplanets:rocket_t2:4>,
  <galacticraftplanets:rocket_t2:11>,
  <galacticraftplanets:rocket_t2:12>,
  <galacticraftplanets:rocket_t2:13>,
  <galacticraftplanets:rocket_t2:14>,
  <galacticraftplanets:rocket_t3>,
  <galacticraftplanets:rocket_t3:1>,
  <galacticraftplanets:rocket_t3:2>,
  <galacticraftplanets:rocket_t3:3>,
  <galacticraftplanets:rocket_t3:4>,
  <galaxyspace:rocket_tier_4>,
  <galaxyspace:rocket_tier_4:1>,
  <galaxyspace:rocket_tier_4:2>,
  <galaxyspace:rocket_tier_4:3>,
  <galaxyspace:rocket_tier_4:4>,
  <galaxyspace:rocket_tier_5>,
  <galaxyspace:rocket_tier_5:1>,
  <galaxyspace:rocket_tier_5:2>,
  <galaxyspace:rocket_tier_5:3>,
  <galaxyspace:rocket_tier_5:4>,
  <galaxyspace:rocket_tier_6>,
  <galaxyspace:rocket_tier_6:1>,
  <galaxyspace:rocket_tier_6:2>,
  <galaxyspace:rocket_tier_6:3>,
  <galaxyspace:rocket_tier_6:4>,
  // Ores, ect. made obselete via other mods
  <crossroads:ore_tin>,
  <crossroads:ore_copper>,
  <crossroads:ore_native_copper>,
  <galacticraftcore:basic_block_core:7>,
  <galacticraftcore:basic_block_core:5>,
  <galaxyspace:gsores:1>,
  <galaxyspace:gsores:2>,
  <galaxyspace:ingots>,
  <galaxyspace:ingots:1>,
  // Just kinda broken
  <artifacts:ultimate_pendant>,
  // Tungsten
  <qmd:ingot>,
  // Titanium
  <qmd:ingot:3>,
  // Nickel
  <qmd:ingot:5>,
  // Zinc
  <qmd:ingot:7>,
  // Platinum
  <qmd:ingot:10>,
  // Niobium
  <qmd:ingot:1>,
  // Quartz dust
  <nuclearcraft:gem_dust:2>,
  // Fluorite
  <nuclearcraft:gem_dust:5>,
  <nuclearcraft:gem:2>,
  // Sulfur dust
  <crossroads:sulfur>,
  <galaxyspace:gs_basic:7>,
  // Saltpeter
  <mist:saltpeter>,
  <qmd:chemical_dust:2>
] as IItemStack[];

for item in toHide {
  // JEI.removeAndHide(item);
  ItemStages.addItemStage("disabled", item);
}

val assemblerToRemove = [
  <galaxyspace:rocket_parts:0>,
  <galaxyspace:rocket_parts:1>,
  <galaxyspace:rocket_parts:2>,
  <galaxyspace:rocket_parts:3>,
  <galaxyspace:rocket_parts:4>,
  <galaxyspace:rocket_parts:5>,
  <galaxyspace:rocket_parts:6>,
  <galaxyspace:rocket_parts:7>,
  <galaxyspace:rocket_parts:8>,
  <galaxyspace:rocket_parts:9>,
  <galaxyspace:rocket_parts:10>,
  <galaxyspace:rocket_parts:11>,
  <galaxyspace:rocket_parts:12>,
  <galaxyspace:rocket_parts:13>,
  <galaxyspace:rocket_parts:14>,
  <galaxyspace:rocket_parts:15>,
  <galaxyspace:rocket_parts:16>,
  <galaxyspace:rocket_parts:17>,
  <galaxyspace:rocket_parts:18>,
  <galaxyspace:rocket_parts:19>
] as IItemStack[];

for item in assemblerToRemove {
  mods.galaxyspace.removeAssemblyRecipe(item);
  // JEI.removeAndHide(item);
  ItemStages.addItemStage("disabled", item);
}

furnace.remove(<warpdrive:component:26>);
JEI.hide(<warpdrive:component:26>);