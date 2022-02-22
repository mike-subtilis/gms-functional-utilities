function test_struct_deepEquals(_context) {
	context = _context;
	test_describe("struct_deepEquals()", context, function() {
		test_it("should return true for the same struct", context, function() {
			var sourceStruct = { name: "abc", value: 123 };
			test_expect(struct_deepEquals(sourceStruct, sourceStruct)).toBe(true);
		});
	});
}
