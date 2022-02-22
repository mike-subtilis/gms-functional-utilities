function test_array_without(_context) {
	context = _context;
	test_describe("array_without()", context, function() {
		test_it("should remove all values in the specified list", context, function() {
			test_expect(array_without(["abc", "def", "ghi", "jkl"], ["abc", "def"])).toEqual(["ghi", "jkl"]);
		});
		test_it("should work if there are no matches in the specified list", context, function() {
			test_expect(array_without(["abc", "def"], ["ghi"])).toEqual(["abc", "def"]);
		});
	});
}

