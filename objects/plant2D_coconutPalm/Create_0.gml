/// @description Insert description here
// You can write your code in this editor

system = plant2D_createSystem();

system.axiom = "I(1)F(0)";
system.symbols = [
	"I(n)", // immature trunk... grows wider first
	"M(n)", // mature trunk... grows vertically
	"T", // final trunk... no more growing
	"F(n)", // flower... grows one leaf at a time
	"C", // mature flower... no more growing
	"S(n)", // leaf spear...
	"L", // leaf... no more growing
	"+(n)", // angle of leaf out of flower
];

plant2D_addGenerationRule(system, "I(n)", "I(n+1)", "n < 5");
plant2D_addGenerationRule(system, "I(n)", "M(1)", "n = 5");
plant2D_addGenerationRule(system, "M(n)", "M(n+1)", "n < 20");
plant2D_addGenerationRule(system, "M(n)", "T", "n = 10");
plant2D_addGenerationRule(system, "F(n)", "F(n+1)", "n/20");
plant2D_addGenerationRule(system, "F(n)", "F(n+1)+(n)S(1)", "1 - n/20");
plant2D_addGenerationRule(system, "F(n)", "C", "n = 20");
plant2D_addGenerationRule(system, "S(n)", "S(n+1)", "n < 5");
plant2D_addGenerationRule(system, "S(n)", "L", "n = 5");

plant2D_addRenderingLine(system, "I(n)", 5, "3 * sqrt(n)", c_white);
plant2D_addTurtleMove(system, "I(n)", 5);
plant2D_addRenderingLine(system, "M(n)", "5 * n", 9, c_grey);
plant2D_addTurtleMove(system, "M(n)", "5 * n");
plant2D_addRenderingCircle(system, "F(n)", 5, c_orange);
plant2D_addRenderingLine(system, "S(n)", "2 * n", 2, c_green);
plant2D_addTurtleMove(system, "L", 4);
plant2D_addRenderingCircle(system, "L", 4, c_green);
plant2D_addTurtleRotate(system, "+(n)", "rand(n) * 160 - 80");

plantGeometry = plant2D_createPlantGeometry(system, 5);
