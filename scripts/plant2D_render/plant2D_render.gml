// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_render(xx, yy, rot, system, plantDefinition) {
	var turtleStack = ds_stack_create();
	var turtle = { x: xx, y: yy, rot: rot };

	for (var i = 0; i < ds_list_size(plantDefinition); i++) {
		var symbolInfo = plantDefinition[| i];

		switch (symbolInfo.symbol) {
			case "[":
				var oldTurtle = turtle;
				ds_stack_push(turtleStack, oldTurtle);
				turtle = { x: oldTurtle.x, y: oldTurtle.y, rot: oldTurtle.rot };
				break;
			case "]":
				delete turtle;
				turtle = ds_stack_pop(turtleStack);
				break;
			default:
				if (!is_undefined(system.rendering[$ symbolInfo.symbol])) {
					for (var j = 0; j < ds_list_size(system.rendering[$ symbolInfo.symbol]); j++) {
						var r = system.rendering[$ symbolInfo.symbol][| j];
						r.apply(turtle, r.applyStaticParams);
					}
				}
				if (!is_undefined(system.turtle[$ symbolInfo.symbol])) {
					for (var j = 0; j < ds_list_size(system.turtle[$ symbolInfo.symbol]); j++) {
						var r = system.turtle[$ symbolInfo.symbol][| j];
						r.apply(turtle, r.applyStaticParams);						
					}
				}
				break;
		}
	}
	delete turtle;
	ds_stack_destroy(turtleStack);
}
