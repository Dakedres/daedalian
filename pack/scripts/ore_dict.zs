import crafttweaker.item.IItemStack;

<ore:dustNiter>.add(<immersiveengineering:material:24>);
<ore:dustSodiumNitrate>.add(<immersiveengineering:material:24>);

// These aren't plates what 
<ore:plateCopper>.remove(<galacticraftcore:basic_item:6>);
<ore:plateTin>.remove(<galacticraftcore:basic_item:7>);
<ore:plateAluminum>.remove(<galacticraftcore:basic_item:8>);
<ore:plateSteel>.remove(<galacticraftcore:basic_item:9>);
<ore:plateBronze>.remove(<galacticraftcore:basic_item:10>);
<ore:plateIron>.remove(<galacticraftcore:basic_item:11>);

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