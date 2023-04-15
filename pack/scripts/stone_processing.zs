import mods.nuclearcraft.RockCrusher;

// Slade has argulentum, zirconium, and arsenic
RockCrusher.addRecipe(<contenttweaker:slade>, <nuclearcraft:compound:11>, <nuclearcraft:dust:10>, <nuclearcraft:gem_dust:10>);
// Basanite has magnesium, dirt quartz dust, and villumanite
RockCrusher.addRecipe(<contenttweaker:obsidian_sand>, <nuclearcraft:gem_dust:8>, <ore:dustGraphite>, <nuclearcraft:dust:7>);
// Tachylite has rhodochrosite, iron, and manganese
RockCrusher.addRecipe(<contenttweaker:composite>, <ore:dustRhodochrosite>, <ore:dustIron>, <ore:dustManganese>);
// Chert has beryllium, fluorite, and carobbiite
RockCrusher.addRecipe(<contenttweaker:alabaster>, <ore:dustCarobbiite>, <ore:dustBeryllium>, <ore:dustFluorite>);

recipes.addShaped(<contenttweaker:slade_brick>, [
  [ <contenttweaker:slade>, <contenttweaker:slade> ],
  [ <contenttweaker:slade>, <contenttweaker:slade> ]
]);

recipes.addShaped(<contenttweaker:alabaster_brick>, [
  [ <contenttweaker:alabaster>, <contenttweaker:alabaster> ],
  [ <contenttweaker:alabaster>, <contenttweaker:alabaster> ]
]);