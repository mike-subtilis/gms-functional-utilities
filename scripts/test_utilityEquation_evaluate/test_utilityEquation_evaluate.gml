function test_utilityEquation_evaluate(_context) {
	context = _context;
	test_describe("Equation.evaluate()", context, function() {
		sut = new EquationParser(["a", "b"]);
		test_it("should evaluate an empty string", context, function() {
			test_expect(sut.parse("").evaluate(undefined)).toEqual(undefined);
		});
		test_describe("numbers", context, function() {
			test_it("should evaluate standalone numbers", context, function() {
				test_expect(sut.parse("12.34").evaluate(undefined)).toEqual(12.34);
			});
			test_it("should evaluate standalone negative numbers", context, function() {
				test_expect(sut.parse("-56.78").evaluate(undefined)).toEqual(-56.78);
			});
		});
		test_describe("standard infix operators", context, function() {
			test_it("should evaluate +", context, function() {
				test_expect(sut.parse("5.1+4.9").evaluate(undefined)).toEqual(10);
			});
			test_it("should evaluate -", context, function() {
				test_expect(sut.parse("123-56.78").evaluate(undefined)).toEqual(66.22);
			});
			test_it("should evaluate *", context, function() {
				test_expect(sut.parse("2 * 3").evaluate(undefined)).toEqual(6);
			});
			test_it("should evaluate /", context, function() {
				test_expect(sut.parse("10 / 2.5").evaluate(undefined)).toEqual(4);
			});
			test_it("should evaluate ^", context, function() {
				test_expect(sut.parse("2 ^ 3").evaluate(undefined)).toEqual(8);
			});
			test_it("should evaluate ^ the other way", context, function() {
				test_expect(sut.parse("3 ^ 2").evaluate(undefined)).toEqual(9);
			});
		});

		test_describe("functions", context, function() {
			test_it("min()", context, function() {
				test_expect(sut.parse("min(5, 3)").evaluate()).toEqual(3);
			});
			test_it("min() with negatives", context, function() {
				test_expect(sut.parse("min(-5, -3)").evaluate()).toEqual(-5);
			});
			test_it("max() with inner equations", context, function() {
				test_expect(sut.parse("max(-5, -3+4)").evaluate()).toEqual(1);
			});
		});

		test_describe("boolean comparisons", context, function() {
			test_it("<", context, function() {
				test_expect(sut.parse("1.5 < 2").evaluate()).toEqual(1);
			});
			test_it(">", context, function() {
				test_expect(sut.parse("1.5 > 2").evaluate()).toEqual(0);
			});
			test_it(">=", context, function() {
				test_expect(sut.parse("2 >= 2").evaluate()).toEqual(1);
			});
		});
		
		test_describe("variable substitution", context, function() {
			test_describe("single variable", context, function() {
				equationA = sut.parse("a");
				test_it("substitute integer", context, function() {
					test_expect(equationA.evaluate({ a: 5 })).toEqual(5);
				});
				test_it("substitute real", context, function() {
					test_expect(equationA.evaluate({ a: 3.9 })).toEqual(3.9);
				});
				test_it("substitute negative", context, function() {
					test_expect(equationA.evaluate({ a: -1.23 })).toEqual(-1.23);
				});
			});

			test_describe("multiple variables", context, function() {
				test_describe("a+b", context, function() {
					equationAPlusB = sut.parse("a + b");
					test_it("substitute integers", context, function() {
						test_expect(equationAPlusB.evaluate({ a: 5, b: 2 })).toEqual(7);
					});
					test_it("subsitute reals", context, function() {
						test_expect(equationAPlusB.evaluate({ a: 3.9, b: -1.2 })).toEqual(2.7);
					});
				});
				
				test_describe("a^2 + 2*a*b + b^2", context, function() {
					equationAPlusBSquared = sut.parse("a^2 + 2*a*b + b^2");
					test_it("substitute var set 1", context, function() {
						test_expect(equationAPlusBSquared.evaluate({ a: 5, b: 2 })).toEqual(49);
					});
					test_it("substitute var set 2", context, function() {
						test_expect(equationAPlusBSquared.evaluate({ a: -3, b: 2 })).toEqual(1);
					});
				});
			});
		});
	});
}