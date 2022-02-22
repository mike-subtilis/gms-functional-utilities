function test_runAllTests(){
	show_debug_message("\nStarting unit tests...\n========================");
	var suiteContext = new TestContext();

	testAll_array(suiteContext);
	testAll_struct(suiteContext);
	testAll_unitTesting(suiteContext);
	testAll_equation(suiteContext);
	testAll_gml(suiteContext);
	test_interpolateSingleVarFunction(suiteContext);

	show_debug_message("========================\n"
		+ "Unit tests completed: "
		+ string(suiteContext.numberPassed) + " Passed, "
		+ string(suiteContext.numberFailed) + " Failed.\n");
}
