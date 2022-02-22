function testAll_equation(_context) {
	test_utilityEquation_evaluate(_context);
	test_utilityEquationParser_tokenize(_context);
	test_utilityEquationParser_tokenize_errors(_context);
	test_utilityEquationParser_translateToPostfix(_context);
}
