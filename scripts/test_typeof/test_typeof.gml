function test_typeof(_context) {
	context = _context;
	test_describe("typeof", context, function() {
		test_it("\"abc\" == string", context, function() {
			test_expect(typeof("abc")).toBe("string");
		});
		test_it("9.81 == number", context, function() {
			test_expect(typeof(9.81)).toBe("number");
		});
		test_it("true == bool", context, function() {
			test_expect(typeof(true)).toBe("number"); // NOTE: not "bool"
		});
	});
}