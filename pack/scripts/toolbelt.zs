import mods.jei.JEI;

recipes.remove(<toolbelt:belt>);
JEI.removeAndHide(<toolbelt:pouch>);

recipes.addShaped("toolbelt_preloaded", <toolbelt:belt>.withTag({Size: 9}), [
  [ <ore:leather>, <ore:ingotIron>, <ore:leather> ]
]);