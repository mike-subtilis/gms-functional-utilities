/// @description Insert description here
// You can write your code in this editor

system = plant2D_createSystem();

system.axiom = "F";
system.symbols = [
	"F",
	"T",
	"L",
	"+",
	"-"
];

plant2D_addGenerationRule(system, "F", "T[+F]F", 0.2);
plant2D_addGenerationRule(system, "F", "T[-F]F", 0.2);
plant2D_addGenerationRule(system, "F", "T[++F]F", 0.1);
plant2D_addGenerationRule(system, "F", "T[--F]F", 0.1);
plant2D_addGenerationRule(system, "F", "T", 0.05);
plant2D_addGenerationRule(system, "F", "TL", 0.1);
plant2D_addGenerationRule(system, "F", "TF", 0.2);

plant2D_addRenderingLine(system, "F", 10, 2, c_grey);
plant2D_addTurtleMove(system, "F", 10);
plant2D_addRenderingLine(system, "T", 10, 2, c_grey);
plant2D_addTurtleMove(system, "T", 10);
plant2D_addRenderingCircle(system, "L", 3, c_green);
plant2D_addTurtleRotate(system, "+", 30);
plant2D_addTurtleRotate(system, "-", -30);

plantGeometry = plant2D_createPlantGeometry(system, 10);
