import mods.ItemStages;
import crafttweaker.item.IItemStack;
import crafttweaker.event.PlayerChangedDimensionEvent;

val mist = "mist";
val glacidus = "glacidus";
val jannsen = "jannsen";
val defiled = "defiled";

ItemStages.stageModItems(mist, "mist");
ItemStages.stageModItems(glacidus, "glacidus");
ItemStages.stageModItems(jannsen, "spacemod");
ItemStages.stageModItems(defiled, "defiledlands");

// SECRET SAUCE:
// \n.*?|.*?(-?\d+).*?\.([a-z+]+).*?\n
// \n$2 : $1\n\n

// OTHER SAUCE
// \n\s*:\s*\n
// \n\n

val dims = {
  mist : 69,
  jannsen : -1101,
  defiled : 2000,
  glacidus : 84,
	barnadara_c : -1030,
	proxima_b : -1025,
	tauceti_f : -1338,
  phobos : -1012,
  io : -1014,
  europa : -1015,
  ganymede : -1016,
  callisto : -1022,
  enceladus : -1017,
  titan : -1018,
  miranda : -1024,
  triton : -1021,
  pluto: -1008,
  haumea: -1023,
  // ceres : -1007,

} as int[string];

val items = {
  // ceres: [
  //   <galaxyspace:ceresblocks:*>,
  //   <galaxyspace:dungeon_blocks>
  // ],
  barnadara_c : [
    <galaxyspace:barnarda_c_grasses:*>,
    <galaxyspace:barnarda_c_blocks:*>,
    <galaxyspace:barnarda_c_ores:*>,
    <galaxyspace:barnarda_c_falling_blocks:*>,
    <galaxyspace:barnarda_c_test_log:*>,
    <galaxyspace:barnarda_c_birch_log:*>,
    <galaxyspace:barnarda_c_test_glow_log:*>,
    <galaxyspace:barnarda_c_dandelions:*>,
    <galaxyspace:barnarda_c_leaves:*>,
    <galaxyspace:barnarda_c_farmland:*>,
    <galaxyspace:br_basic:*>,
    <galaxyspace:br_foods:*>
  ],
  proxima_b: [
    <galaxyspace:proxima_b_blocks:*>,
    <galaxyspace:proxima_b_log_1:*>,
    <galaxyspace:proxima_b_log_2:*>,
    <galaxyspace:proxima_b_mushroom_log:*>,
    <galaxyspace:proxima_b_grasses:*>,
    <galaxyspace:proxima_b_dandelions:*>
  ],
  tauceti_f: [
    <galaxyspace:tauceti_f_blocks:*>,
    <galaxyspace:tauceti_f_watergrass:*>,
    <galaxyspace:tauceti_f_corals:*>
  ],
  phobos: [ <galaxyspace:phobosblocks:*> ],
  io: [
    <galaxyspace:ioblocks:*>,
    <galaxyspace:dungeon_blocks:1>  
  ],
  europa: [
    <galaxyspace:europablocks:*>,
    <galaxyspace:europa_geyser:*>,
    <galaxyspace:europa_uwgeyser:*>
  ],
  ganymede: [ <galaxyspace:ganymedeblocks:*> ],
  callisto: [ <galaxyspace:callistoblocks:*> ],
  enceladus: [
    <galaxyspace:enceladusblocks:*>, 
    <galaxyspace:enceladus_crystal>
  ],
  titan: [ <galaxyspace:titanblocks:*> ],
  miranda: [ <galaxyspace:mirandablocks:*> ],
  triton: [ <galaxyspace:tritonblocks:*> ],
  haumea: [ <galaxyspace:haumeablocks:*> ],
  pluto: [ <galaxyspace:plutoblocks:*> ]
} as IItemStack[][string];

for key in items {
  for item in items[key] {
    ItemStages.addItemStage(key, item);
  }
}

events.onPlayerChangedDimension(function(event as PlayerChangedDimensionEvent) {
  for name in dims {
    if(event.to == dims[name] && !event.player.hasGameStage(name) ) {
      event.player.addGameStage(name);
    }
  }
});
