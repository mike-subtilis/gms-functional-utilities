function test_struct_clone(_context) {
	context = _context;
	test_describe("struct_clone()", context, function() {
		test_it("should not return the same struct", context, function() {
			var sourceStruct = { name: "abc", value: 123 };
			test_expect(struct_clone(sourceStruct)).notToBe(sourceStruct);
		});
		test_it("should return the same values for all fields", context, function() {
			var sourceStruct = { name: "abc", value: 123 };
			test_expect(struct_clone(sourceStruct)).toEqual({ name: "abc", value: 123 });
		});
	});
}
