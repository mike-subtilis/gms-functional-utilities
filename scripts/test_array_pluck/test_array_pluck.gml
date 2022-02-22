function test_array_pluck(_context) {
	context = _context;
	test_describe("array_pluck()", context, function() {
		test_it("should work on an undefined array", context, function() {
			test_expect(array_pluck(undefined, "name")).toEqual([]);
		});
		test_it("should extract from an array with no values", context, function() {
			test_expect(array_pluck([], "name")).toEqual([]);
		});
		test_it("should extract a field from each value", context, function() {
			test_expect(array_pluck([{ name: "abc" }, { name: "def" }], "name")).toEqual(["abc", "def"]);
		});
	});
}
