/// @description Insert description here
// You can write your code in this editor

system = plant2D_createSystem();

plant2D_addGenerationRule(system, "F", "FF");
plant2D_addGenerationRule(system, "X", "F+[[X]-X]-F[-FX]+X");

plant2D_addRenderingLine(system, "F", 5, 2, c_white);
plant2D_addTurtleMove(system, "F", 5);
//plant2D_addRenderingCircle(system, "X", 2, c_purple);
plant2D_addTurtleRotate(system, "+", 25);
plant2D_addTurtleRotate(system, "-", -25);

plantGeometry = plant2D_createPlantGeometry(system, 5);
