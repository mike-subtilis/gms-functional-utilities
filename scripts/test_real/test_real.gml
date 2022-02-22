function test_real(_context) {
	context = _context;
	test_describe("real()", context, function() {
		test_it("should throw an error with a non-number", context, function() {
			test_expect(function() { var invalidNum = "abc"; return real(invalidNum + "9"); }).toThrow();
		});
		test_it("should drop a trailing decimal separator (period)", context, function() {
			test_expect(real("1.")).toEqual(1);
		});
		test_it("should drop a trailing period with a negative number", context, function() {
			test_expect(real("-12.")).toEqual(-12);
		});
		test_it("should allow a prefixed +", context, function() {
			test_expect(real("+123")).toEqual(123);
		});
		test_it("should parse a single digit number", context, function() {
			test_expect(real("9")).toEqual(9);
		});
		test_it("should parse a multiple digit number", context, function() {
			test_expect(real("1239")).toEqual(1239);
		});
		test_it("should parse a multiple digit negative number", context, function() {
			test_expect(real("-123")).toEqual(-123);
		});
		test_it("should parse a number with a decimal", context, function() {
			test_expect(real("12.34")).toEqual(12.34);
		});
	});
}
