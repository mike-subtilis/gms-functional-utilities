function test_struct_omit(_context) {
	context = _context;
	test_describe("struct_omit()", context, function() {
		test_it("should do nothing if no fields are specifed", context, function() {
			test_expect(struct_omit({ x: 1, y: 2, z: 3 }, [])).toEqual({ x: 1, y: 2, z: 3 });
		});
		test_it("should omit a single specified field", context, function() {
			test_expect(struct_omit({ x: 1, y: 2, z: 3 }, ["y"])).toEqual({ x: 1, z: 3 });
		});
		test_it("should omit multiple specified field", context, function() {
			test_expect(struct_omit({ x: 1, y: 2, z: 3 }, ["x", "y"])).toEqual({ z: 3 });
		});
	});
}
