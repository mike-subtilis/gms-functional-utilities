function test_array_intersection(_context){
	context = _context;
	test_describe("array_intersection()", context, function() {
		test_it("should work on undefined arrays", context, function() {
			test_expect(array_intersection(undefined, undefined)).toEqual([]);
		});
		test_it("should work on empty arrays", context, function() {
			test_expect(array_intersection([], [])).toEqual([]);
		});
		test_it("should work when the 1st array is empty", context, function() {
			test_expect(array_intersection([], ["abc"])).toEqual([]);
		});
		test_it("should work when the 2nd array is empty", context, function() {
			test_expect(array_intersection(["abc"], [])).toEqual([]);
		});
		test_it("should work when the arrays have no common items", context, function() {
			test_expect(array_intersection(["abc"], ["def"])).toEqual([]);
		});
		test_it("should work when the arrays have one common item", context, function() {
			test_expect(array_intersection(["abc", "def"], ["abc"])).toEqual(["abc"]);
		});
		test_it("should work when the arrays have many common items", context, function() {
			test_expect(array_intersection(["abc", "def", "ghi", "jkl"], ["def", "jkl", "xyz"])).toEqual(["def", "jkl"]);
		});
	});
}
