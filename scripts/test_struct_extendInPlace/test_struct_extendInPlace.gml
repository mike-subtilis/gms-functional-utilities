function test_struct_extendInPlace(_context) {
	context = _context;
	test_describe("struct_extendInPlace()", context, function() {
		test_it("should return the same struct", context, function() {
			var sourceStruct = { name: "abc", value: 123 };
			test_expect(struct_extendInPlace(sourceStruct)).toBe(sourceStruct);
		});

		test_it("should return the same struct", context, function() {
			var sourceStructA = { name: "abc", value: 123 };
			var sourceStructB = { name: "def", valueType: "number" };
			test_expect(struct_extendInPlace(sourceStructA, sourceStructB)).toBe(sourceStructA);
		});

		test_it("should return the same values for all fields", context, function() {
			var sourceStruct = { name: "abc", value: 123 };
			test_expect(struct_extendInPlace(sourceStruct)).toEqual({ name: "abc", value: 123 });
		});

		test_it("should honour later params", context, function() {
			var sourceStructA = { name: "abc", value: 123 };
			var sourceStructB = { name: "def", valueType: "number" };
			test_expect(struct_extendInPlace(sourceStructA, sourceStructB)).toEqual({ name: "def", value: 123, valueType: "number" });
		});
	});
}
