import crafttweaker.item.IItemStack;

<ore:dustNiter>.add(<immersiveengineering:material:24>);
<ore:dustSodiumNitrate>.add(<immersiveengineering:material:24>);

// Utilities

val utilityItems = [
  <hooked:hook:*>,
  <immersiveengineering:wooden_device0>,
  <refinedstorage:portable_grid>
] as IItemStack[];

for item in utilityItems {
  <ore:utilities>.add(item);
}

for item in loadedMods["worsebarrels"].items {
  <ore:utilities>.add(item);
}

for item in loadedMods["tesslocator"].items {
  <ore:utilities>.add(item);
}

for item in loadedMods["schematics"].items {
  <ore:utilities>.add(item);
}

for item in loadedMods["buildersbag"].items {
  <ore:utilities>.add(item);
}