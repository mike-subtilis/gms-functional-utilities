// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_addRenderingLine(system, symbol, lineLength, lineWidth, lineColor) {
	if (is_undefined(system.rendering[$ symbol])) {
		system.rendering[$ symbol] = ds_list_create();	
	}
	var symbolRenderer = {
		apply: function(turtle, params) {
			var x2 = turtle.x + dcos(turtle.rot) * params[0]; // lineLength;
			var y2 = turtle.y - dsin(turtle.rot) * params[0]; // lineLength;
			draw_line_width_color(turtle.x, turtle.y, x2, y2, params[1], params[2], params[2]); // lineWidth, lineColor, lineColor);
		},
		applyStaticParams: [lineLength, lineWidth, lineColor],
	};
	ds_list_add(system.rendering[$ symbol], symbolRenderer);
}
