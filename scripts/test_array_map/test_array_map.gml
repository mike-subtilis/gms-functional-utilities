function test_array_map(_context) {
	context = _context;
	test_describe("array_map()", context, function() {
		test_it("should handle undefined", context, function() {
			test_expect(array_map(undefined, function(o) { return o * 2; }, undefined)).toEqual([]);
		});
		test_it("should map multiple values", context, function() {
			test_expect(array_map([1, 2, 3, 4, 5], function(o) { return o * 2; }, undefined)).toEqual([2, 4, 6, 8, 10]);
		});
		test_it("should pass a map param", context, function() {
			test_expect(array_map([1, 2, 3, 4, 5], function(o, multiple) { return o * multiple; }, 3)).toEqual([3, 6, 9, 12, 15]);
		});
	});
}
