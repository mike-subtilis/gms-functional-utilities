function test_array_union(_context) {
	context = _context;
	test_describe("array_union()", context, function() {
		test_it("should work on undefined arrays", context, function() {
			test_expect(array_union(undefined, undefined)).toEqual([]);
		});
		test_it("should work on empty arrays", context, function() {
			test_expect(array_union([], [])).toEqual([]);
		});
		test_it("should work when the 1st array is empty", context, function() {
			test_expect(array_union([], ["abc"])).toEqual(["abc"]);
		});
		test_it("should work when the 2nd array is empty", context, function() {
			test_expect(array_union(["abc"], [])).toEqual(["abc"]);
		});
		test_it("should work when the arrays have no common items", context, function() {
			test_expect(array_union(["abc"], ["def"])).toEqual(["abc", "def"]);
		});
		test_it("should eliminate duplicates from either array", context, function() {
			test_expect(array_union(["abc", "def", "abc"], ["def"])).toEqual(["abc", "def"]);
		});
		test_it("should work when the arrays have one common item", context, function() {
			test_expect(array_union(["abc", "def"], ["abc"])).toEqual(["abc", "def"]);
		});
		test_it("should work when the arrays have many common items", context, function() {
			test_expect(array_union(["abc", "def", "ghi", "jkl"], ["def", "jkl", "xyz"])).toEqual(["abc", "def", "ghi", "jkl", "xyz"]);
		});
	});
}
