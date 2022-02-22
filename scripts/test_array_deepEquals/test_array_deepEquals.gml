function test_array_deepEquals(_context) {
	context = _context;
	test_describe("array_deepEquals()", context, function() {

		test_it("undefined == undefined", context, function() {
			test_expect(array_deepEquals(undefined, undefined)).toEqual(false);
		});
		test_it("undefined != []", context, function() {
			test_expect(array_deepEquals(undefined, [])).toEqual(false);
		});
		test_it("shallow equality", context, function() {
			test_expect(array_deepEquals([1, 2, 3], [1, 2, 3])).toEqual(true);
		});
		test_it("requires order to be preserved", context, function() {
			test_expect(array_deepEquals([1, 2, 3], [3, 2, 1])).toEqual(false);
		});
		test_it("requires all values to be present", context, function() {
			test_expect(array_deepEquals([1, 2, 3], [1])).toEqual(false);
		});
		test_it("requires shallow values to match", context, function() {
			test_expect(array_deepEquals([1, 2, 3], [4, 5, 6])).toEqual(false);
		});
		test_it("tests nested arrays", context, function() {
			test_expect(array_deepEquals([[1, 2], ["abc", "def"]], [[1, 2], ["abc", "def"]])).toEqual(true);
		});
		test_it("arrays of matching structs returns true", context, function() {
			test_expect(array_deepEquals([{ x: 1, y: 2 }, { x: 2, y: 4 }], [{ x: 1, y: 2 }, { x: 2, y: 4 }])).toEqual(true);
		});
		test_it("arrays of differing structs returns false", context, function() {
			test_expect(array_deepEquals([{ x: 1, y: 1 }, { x: 2, y: 4 }], [{ x: 1, y: 3 }, { x: 2, y: 9 }])).toEqual(false);
		});
	});
}
