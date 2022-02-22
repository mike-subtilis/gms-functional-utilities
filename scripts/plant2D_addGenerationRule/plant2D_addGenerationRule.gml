// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_addGenerationRule(system, symbol, successor, weight) {
	if (is_undefined(system.generation[$ symbol])) {
		system.generation[$ symbol]	= {
			successors: ds_list_create(),
		};
	}

	ds_list_add(system.generation[$ symbol].successors,
		new Plant2DGenerationRule(symbol, successor, weight));
}
