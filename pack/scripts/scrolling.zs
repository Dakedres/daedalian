import mods.zenscroll.ZenScroll;
import mods.jei.JEI;

var solCompass = <minecraft:compass>.withTag({
  RepairCost: 0,
  giacomosbussolaID: 1678126769228 as long,
  display: {Name: "Inner Sol"},
  giacomosbussolaY: 0 as float,
  giacomosbussolaZ: 0 as float,
  giacomosbussolaX: 0 as float
});

ZenScroll.add(
  solCompass,
  <minecraft:compass>.withTag({
    RepairCost: 0,
    giacomosbussolaID: 1678126769228 as long,
    display: {Name: "Outer Sol"},
    giacomosbussolaY: 0 as float,
    giacomosbussolaZ: 0 as float,
    giacomosbussolaX: -22000 as float
  }),
  <minecraft:compass>.withTag({
    RepairCost: 0,
    giacomosbussolaID: 1678126769228 as long,
    display: {Name: "Proxima Centauri"},
    giacomosbussolaY: -64000 as float,
    giacomosbussolaZ: 0 as float,
    giacomosbussolaX: -70000 as float
  }),
  <minecraft:compass>.withTag({
    RepairCost: 0,
    giacomosbussolaID: 1678126769228 as long,
    display: {Name: "Barnard's System"},
    giacomosbussolaY: 20000 as float,
    giacomosbussolaZ: 0 as float,
    giacomosbussolaX: 20000 as float
  })
);

recipes.addShapeless(solCompass, [
  <minecraft:paper>, <minecraft:compass>
]);


val tiers = [
  "basic",
  "advanced",
  "superior"
] as string[];

val colors = [
  "white",
  "orange",
  "magenta",
  "light_blue",
  "yellow",
  "lime",
  "pink",
  "gray",
  "silver",
  "cyan",
  "purple",
  "blue",
  "brown",
  "green",
  "red",
  "black"
] as string[];

for i, color in colors {
  for tier in tiers {
    val baseId = "warpdrive:hull." ~ tier;
    val slabId = baseId ~ ".slab_" ~ color;

    // This is visually the exact same as a full block and I don't know
    //   why it's even in JEI.
    JEI.hide(itemUtils.getItem(slabId, 12));

    ZenScroll.add(
      itemUtils.getItem(baseId ~ ".plain", i),
      itemUtils.getItem(baseId ~ ".tiled", i),
      itemUtils.getItem(slabId, 13),
      itemUtils.getItem(slabId, 14),
      itemUtils.getItem(slabId, 15),
      itemUtils.getItem(slabId, 0),
      itemUtils.getItem(slabId, 2),
      itemUtils.getItem(slabId, 6),
      itemUtils.getItem(slabId, 8)
    );
  }
}