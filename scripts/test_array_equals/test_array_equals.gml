function test_array_equals(_context) {
	context = _context;
	test_describe("array_equals()", context, function() {
		test_it("should match empty arrays", context, function() {
			test_expect(array_equals([], [])).toEqual(true);
		});
		test_it("should match arrays of equal primitive data types", context, function() {
			test_expect(array_equals([1, 3, 5], [1, 3, 5])).toEqual(true);
		});
		test_it("should expect arrays to have equal order", context, function() {
			test_expect(array_equals([1, 3, 5], [5, 3, 1])).toEqual(false);
		});
		test_it("should expect the same values", context, function() {
			test_expect(array_equals(["abc", "def"], ["def", "ghi"])).toEqual(false);
		});
		test_it("should be false if the contents are equivalent but different structs", context, function() {
			test_expect(array_equals([{ x: 1, y: 2 }, { x: 2, y: 4 }],
				[{ x: 1, y: 2 }, { x: 2, y: 4 }])).toEqual(false);
		});
		test_it("should be true if the items are the same structs", context, function() {
			var p1 = { x: 1, y: 2 };
			var p2 = { x: 2, y: 4 };
			test_expect(array_equals([p1, p2], [p1, p2])).toEqual(true);
		});
	});
}
