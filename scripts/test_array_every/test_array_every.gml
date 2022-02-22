function test_array_every(_context) {
	context = _context;
	test_describe("array_every()", context, function() {
		sourceArray = [{ name: "abc", value: 1 }, { name: "def", value: 2 }];

		test_it("should return true when all items pass the test", context, function() {
			test_expect(array_every(sourceArray, function(o) { return string_length(o.name) > 0; }, undefined)).toBe(true);
			test_expect(array_every(sourceArray, function(o) { return o.value > 0; }, undefined)).toBe(true);
		});
		test_it("should return false when only one item passes the test", context, function() {
			test_expect(array_every(sourceArray, function(o) { return o.name == "abc"; }, undefined)).toBe(false);
		});
		test_it("should return false when no items pass the test", context, function() {
			test_expect(array_every(sourceArray, function(o) { return o.value == 3; }, undefined)).toBe(false);
		});
	});
}
