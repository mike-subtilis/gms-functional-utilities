function test_array_concat(_context){
	context = _context;
	test_describe("array_concat()", context, function() {
		sourceArrayA = ["abc", "def"];
		sourceArrayB = ["123", "456", "789"];

		test_it("should work on no values", context, function() {
			test_expect(array_concat()).toEqual([]);
		});
		test_it("should work with 1 value", context, function() {
			test_expect(array_concat(sourceArrayA)).toEqual(sourceArrayA);
			test_expect(array_concat(sourceArrayB)).toEqual(sourceArrayB);
		});
		test_it("should work with 2 arrays", context, function() {
			test_expect(array_concat(sourceArrayA, sourceArrayB)).toEqual(["abc", "def", "123", "456", "789"]);
		});
	});
}
