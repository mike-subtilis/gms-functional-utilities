function test_utilityEquationParser_translateToPostfix(_context) {
	context = _context;
	test_describe("Equation.translateToPostfix()", context, function() {
		expectedSymbols = [
			{ equation: "", expected: [] },
			{ equation: "1", expected: [1] },
			{ equation: "123", expected: [123] },
			{ equation: "12.34", expected: [12.34] },
			{ equation: "-56.78", expected: [-56.78] },
			{ equation: "123-56.78", expected: [123, 56.78, "-"] },
			{ equation: "-3+4", expected: [-3, 4, "+"] },
			{ equation: "-3-4", expected: [-3, 4, "-"] },
			{ equation: "x", expected: ["x"] },
			{ equation: "-x", expected: ["x", "-"] },
			{ equation: "x+y", expected: ["x", "y", "+"] },
			{ equation: "x+(y*2)", expected: ["x", "y", 2, "*", "+"] },
			{ equation: "min(x, -x)", expected: ["x", "x", "-", "min"] },
			{ equation: "x^2+y*-5.9", expected: ["x", 2, "^", "y", -5.9, "*", "+"] },
			{ equation: "x^2+y-5.9", expected: ["x", 2, "^", "y", "+", 5.9, "-"] },
			{ equation: "x > y + 1", expected: ["x", "y", 1, "+", ">"] },
			{ equation: "x >= y + 1", expected: ["x", "y", 1, "+", ">="] },
			{ equation: "max(-5, -3+4)", expected: [-5, -3, 4, "+", "max"] },
		];
		
		for (i = 0; i < array_length(expectedSymbols); i++) {
			test_it(expectedSymbols[i].equation, context, function() {
				var sut = new EquationParser(["x", "y"]);
				var tokens = sut.tokenize(expectedSymbols[i].equation);
				var postfixTokens = sut.translateToPostfix(tokens);
				test_expect(array_pluck(postfixTokens, "symbol")).toEqual(expectedSymbols[i].expected);
			});
		}
	});
}
