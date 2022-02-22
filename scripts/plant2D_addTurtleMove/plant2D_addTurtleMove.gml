// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_addTurtleMove(system, symbol, moveDistance) {
	if (is_undefined(system.turtle[$ symbol])) {
		system.turtle[$ symbol] = ds_list_create();	
	}
	var symbolTurtleUpdate = {
		apply: function(turtle, params) {
			var x2 = turtle.x + dcos(turtle.rot) * params[0]; // moveDistance;
			var y2 = turtle.y - dsin(turtle.rot) * params[0]; // moveDistance;
			turtle.x = x2;
			turtle.y = y2;
		},
		applyStaticParams: [moveDistance],
	};
	ds_list_add(system.turtle[$ symbol], symbolTurtleUpdate);
}