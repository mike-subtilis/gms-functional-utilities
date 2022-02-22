// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_addRenderingCircle(system, symbol, radius, color) {
	if (is_undefined(system.rendering[$ symbol])) {
		system.rendering[$ symbol] = ds_list_create();	
	}
	var symbolRenderer = {
		apply: function(turtle, params) {
			draw_circle_color(turtle.x, turtle.y, params[0], params[1], params[1], false);
		},
		applyStaticParams: [radius, color],
	};
	ds_list_add(system.rendering[$ symbol], symbolRenderer);
}