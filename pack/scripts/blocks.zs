#loader contenttweaker

import mods.contenttweaker.VanillaFactory;

var slade = VanillaFactory.createBlock("slade", <blockmaterial:rock>);

slade.setBlockHardness(4.0);
slade.setBlockResistance(1.0);
slade.setToolClass("pickaxe");
slade.register();

var sladeBrick = VanillaFactory.createBlock("slade_brick", <blockmaterial:rock>);

sladeBrick.setBlockHardness(4.0);
sladeBrick.setBlockResistance(1.0);
sladeBrick.setToolClass("pickaxe");
sladeBrick.register();

var obsidianSand = VanillaFactory.createBlock("obsidian_sand", <blockmaterial:sand>);

obsidianSand.setBlockHardness(10.0);
obsidianSand.setBlockResistance(10.0);
obsidianSand.setToolClass("shovel");
obsidianSand.register();

var obsidianSandBlaze = VanillaFactory.createBlock("obsidian_sand_blaze", <blockmaterial:sand>);

obsidianSandBlaze.setBlockHardness(12.0);
obsidianSandBlaze.setBlockResistance(10.0);
obsidianSandBlaze.setToolClass("pickaxe");
obsidianSandBlaze.register();

obsidianSandBlaze.setDropHandler(function(drops, world, position, state, fortune) {
	drops.add(<item:contenttweaker:obsidian_sand>);
	drops.add(<item:minecraft:blaze_rod>);

	return;
});

var composite = VanillaFactory.createBlock("composite", <blockmaterial:rock>);

composite.setBlockHardness(0.7);
composite.setBlockResistance(5.0);
composite.setToolClass("pickaxe");
composite.register();

var alabaster = VanillaFactory.createBlock("alabaster", <blockmaterial:rock>);

alabaster.setBlockHardness(1.0);
alabaster.setBlockResistance(10.0);
alabaster.setToolClass("pickaxe");
alabaster.register();

var alabasterBrick = VanillaFactory.createBlock("alabaster_brick", <blockmaterial:rock>);

alabasterBrick.setBlockHardness(1.5);
alabasterBrick.setBlockResistance(15.0);
alabasterBrick.setToolClass("pickaxe");
alabasterBrick.register();

// var slade = VanillaFactory.createBlock("slade_column", <blockmaterial:rock>);

// slade.setBlockResistance(4.0);
// slade.setToolClass("pickaxe");
// slade.register();