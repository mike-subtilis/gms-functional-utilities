function test_array_filter(_context) {
	context = _context;
	test_describe("array_filter()", context, function() {
		sourceArray = ["++", "+", "-", "--", "!=", "==", ">="];

		test_it("should filter no values", context, function() {
			test_expect(array_filter(sourceArray, function(s) { return string_pos("abc", s) >= 1; }, undefined)).toEqual([]);
		});
		test_it("should filter multiple values", context, function() {
			test_expect(array_filter(sourceArray, function(s) { return string_pos("=", s) >= 1; }, undefined)).toEqual(["!=", "==", ">="]);
		});
	});
}
