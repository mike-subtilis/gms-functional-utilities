// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_addTurtleRotate(system, symbol, rotationDegrees) {
	if (is_undefined(system.turtle[$ symbol])) {
		system.turtle[$ symbol] = ds_list_create();	
	}
	var symbolTurtleUpdate = {
		apply: function(turtle, params) {
			turtle.rot += params[0]; // rotationDegrees;
		},
		applyStaticParams: [rotationDegrees],
	};
	ds_list_add(system.turtle[$ symbol], symbolTurtleUpdate);
}
