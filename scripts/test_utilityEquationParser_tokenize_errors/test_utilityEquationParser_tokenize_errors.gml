function test_utilityEquationParser_tokenize_errors(_context) {
	context = _context;
	test_describe("Equation.tokenize()", context, function() {
		test_it("leading infix operator should throw an error", context, function() {
			test_expect(function() { var sut = new EquationParser(["x", "y"]); sut.tokenize("+x"); }).toThrow();
		});
		test_it("variable names not separated by an operator should throw an error", context, function() {
			test_expect(function() { var sut = new EquationParser(["x", "y"]); sut.tokenize("xy"); }).toThrow();
		});
	});
}
