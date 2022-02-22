function test_array_unique(_context) {
	context = _context;
	test_describe("array_unique()", context, function() {
		test_it("should work on an undefined array", context, function() {
			test_expect(array_unique(undefined)).toEqual([]);
		});
		test_it("should work on an array with no values", context, function() {
			test_expect(array_unique([])).toEqual([]);
		});
		test_it("should remove duplicates of multiple vlaues", context, function() {
			test_expect(array_unique(["abc", "def", "def", "abc", "ghi"])).toEqual(["abc", "def", "ghi"]);
		});
		test_it("should return all values if there are no duplicates", context, function() {
			test_expect(array_unique(["+", "-", "*", "/"])).toEqual(["+", "-", "*", "/"]);
		});
	});
}
