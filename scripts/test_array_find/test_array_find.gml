function test_array_find(_context) {
	context = _context;
	test_describe("array_find()", context, function() {
		sourceArray = ["++", "+", "-", "--", "!=", "==", ">="];

		test_it("should find a single value", context, function() {
			var target = "!=";
			test_expect(array_find(sourceArray, function(s, testParam) { return s == testParam; }, target)).toEqual("!=");
		});
		test_it("should find no values", context, function() {
			var target = "abc";
			test_expect(array_find(sourceArray, function(s, testParam) { return s == testParam; }, target)).toEqual(undefined);
		});
	});
}
