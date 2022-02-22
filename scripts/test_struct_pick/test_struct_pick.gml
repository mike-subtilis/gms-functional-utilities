function test_struct_pick(_context) {
	context = _context;
	test_describe("struct_pick()", context, function() {
		test_it("should return an empty object if no fields are specifed", context, function() {
			test_expect(struct_pick({ x: 1, y: 2, z: 3 }, [])).toEqual({ });
		});
		test_it("should pick a single specified field", context, function() {
			test_expect(struct_pick({ x: 1, y: 2, z: 3 }, ["y"])).toEqual({ y: 2 });
		});
		test_it("should pick multiple specified field", context, function() {
			test_expect(struct_pick({ x: 1, y: 2, z: 3 }, ["x", "y"])).toEqual({ x: 1, y: 2 });
		});
	});
}
