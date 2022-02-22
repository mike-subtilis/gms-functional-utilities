function test_array_each(_context) {
	context = _context;
	test_describe("array_each()", context, function() {
		test_it("should work on a null array", context, function() {
			var increment = { value: 1 };
			array_each(undefined, function(item, testParam) { testParam.value++; }, increment);
			test_expect(increment.value).toBe(1);
		});
		test_it("should work on an empty array", context, function() {
			var increment = { value: 1 };
			array_each([], function(item, testParam) { testParam.value++; }, increment);
			test_expect(increment.value).toBe(1);
		});
		test_it("should run on each value", context, function() {
			var increment = { value: 1 };
			array_each([11, 23, 37], function(item, testParam) { testParam.value += item; }, increment);
			test_expect(increment.value).toBe(72);
		});
	});
}
