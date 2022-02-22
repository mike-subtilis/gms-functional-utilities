// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_addRenderingPolygon(system, symbol, points, color) {
	if (is_undefined(system.rendering[$ symbol])) {
		system.rendering[$ symbol] = ds_list_create();	
	}
	var symbolRenderer = {
		apply: function(turtle, params) {
			draw_set_color(params[1]);
			draw_primitive_begin(pr_trianglestrip);
			for (var i = 0; i < array_length(params[0]); i++) {
				var xx = params[0][i].x * dcos(turtle.rot) + params[0][i].y * dsin(turtle.rot);
				var yy = params[0][i].y * dcos(turtle.rot) - params[0][i].x * dsin(turtle.rot);
				draw_vertex(turtle.x + xx, turtle.y + yy);
		    }
			draw_primitive_end();
		},
		applyStaticParams: [points, color],
	};
	ds_list_add(system.rendering[$ symbol], symbolRenderer);
}