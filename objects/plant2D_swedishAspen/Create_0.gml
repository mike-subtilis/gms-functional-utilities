/// @description Insert description here
// You can write your code in this editor

system = plant2D_createSystem();

system.axiom = "T";
system.symbols = [
	"T", // trunk
	"B", // branch
	"S", // twig / leaf-stem
	"L", // leaf
	"+",
	"-"
];

plant2D_addGenerationRule(system, "T", "TT", 3);
plant2D_addGenerationRule(system, "T", "T[++B]", 1);
plant2D_addGenerationRule(system, "T", "T[--B]", 1);
plant2D_addGenerationRule(system, "T", "[---B][+++B]", 0.5);

plant2D_addGenerationRule(system, "B", "BB", 3);
plant2D_addGenerationRule(system, "B", "B[+B]SL", 1);
plant2D_addGenerationRule(system, "B", "B[-B]SL", 1);
plant2D_addGenerationRule(system, "B", "[--S]SL", 0.5);
plant2D_addGenerationRule(system, "B", "[++S]SL", 0.5);
plant2D_addGenerationRule(system, "S", "SL", 0.75);
plant2D_addGenerationRule(system, "S", "[++++++SL][------SL]S", 0.25);

plant2D_addRenderingLine(system, "T", 10, 7, c_grey);
plant2D_addTurtleMove(system, "T", 10);
plant2D_addRenderingLine(system, "B", 8, 3, c_grey);
plant2D_addTurtleMove(system, "B", 8);
plant2D_addRenderingLine(system, "S", 4, 1, c_grey);
plant2D_addTurtleMove(system, "S", 4);
plant2D_addRenderingCircle(system, "L", 8, c_green);
plant2D_addTurtleRotate(system, "+", 15);
plant2D_addTurtleRotate(system, "-", -15);

plantGeometry = plant2D_createPlantGeometry(system, 10);
