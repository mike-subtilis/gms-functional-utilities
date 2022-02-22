/// @description Insert description here
// You can write your code in this editor

var symbols = [
	"O",
	"V",
	"S",
	"L",
	"R",
	"b",
	"B",
	"+",
	"-"
];
system = new Plant2DSystem(symbols, "OS");

plant2D_addGenerationRule(system, "S", "VS");
plant2D_addGenerationRule(system, "S", "R");
plant2D_addGenerationRule(system, "S", "L");
plant2D_addGenerationRule(system, "L", "V+L", 3);
plant2D_addGenerationRule(system, "L", "V[--Vb]+L", 2);
plant2D_addGenerationRule(system, "L", "V-R", 1);
plant2D_addGenerationRule(system, "R", "V-R", 3);
plant2D_addGenerationRule(system, "R", "V[++Vb]-R", 2);
plant2D_addGenerationRule(system, "R", "V+L", 1);
plant2D_addGenerationRule(system, "b", "B", 1);
plant2D_addGenerationRule(system, "b", "b", 3);
plant2D_addGenerationRule(system, "B", "Z", 1);
plant2D_addGenerationRule(system, "B", "B", 6);

plant2D_addRenderingLine(system, "O", 10, 5, c_green);
plant2D_addTurtleMove(system, "O", 10);
plant2D_addRenderingLine(system, "V", 10, 3, c_green);
plant2D_addTurtleMove(system, "V", 10);
plant2D_addRenderingLine(system, "S", 8, 2, c_green);
plant2D_addTurtleMove(system, "S", 8);
plant2D_addRenderingLine(system, "R", 8, 2, c_green);
plant2D_addTurtleMove(system, "R", 8);
plant2D_addRenderingLine(system, "L", 8, 2, c_green);
plant2D_addTurtleMove(system, "L", 8);
plant2D_addRenderingPolygon(system, "Z", [{ x: 0, y: 0 }, { x: 3, y: 6 }, { x: 3, y: -6 }, { x: 15, y: 0 }], c_yellow);
plant2D_addRenderingCircle(system, "B", 4, c_yellow);
plant2D_addRenderingCircle(system, "b", 2, c_yellow);
plant2D_addTurtleRotate(system, "+", 30);
plant2D_addTurtleRotate(system, "-", -30);

plantGeometry = system.createNewPlantInstance();
growInterval = room_speed * 0.2;
alarm_set(0, random_range(1, room_speed));

system.validate();
show_debug_message(system);
