function test_array_any(_context) {
	context = _context;
	test_describe("array_any()", context, function() {
		sourceArray = [{ name: "abc", value: 1 }, { name: "def", value: 2 }];
		sourceList = ds_list_create();
		ds_list_add(sourceList, { name: "abc", value: 1 });
		ds_list_add(sourceList, { name: "def", value: 2 });
		test_it("should return true when all items pass the test", context, function() {
			test_expect(array_any(sourceArray, function(o) { return string_length(o.name) > 0; }, undefined)).toBe(true);
			test_expect(ds_list_any(sourceList, function(o) { return string_length(o.name) > 0; }, undefined)).toBe(true);

			test_expect(array_any(sourceArray, function(o) { return o.value > 0; }, undefined)).toBe(true);
			test_expect(ds_list_any(sourceList, function(o) { return o.value > 0; }, undefined)).toBe(true);
		});
		test_it("should return true when the first item passes the test", context, function() {
			test_expect(array_any(sourceArray, function(o) { return o.name == "abc"; }, undefined)).toBe(true);
			test_expect(ds_list_any(sourceList, function(o) { return o.name == "abc"; }, undefined)).toBe(true);
		});
		test_it("should return false when no items pass the test", context, function() {
			test_expect(array_any(sourceArray, function(o) { return o.name == "ghi"; }, undefined)).toBe(false);
			test_expect(ds_list_any(sourceList, function(o) { return o.name == "ghi"; }, undefined)).toBe(false);

			test_expect(array_any(sourceArray, function(o) { return o.value == 3; }, undefined)).toBe(false);
			test_expect(ds_list_any(sourceList, function(o) { return o.value == 3; }, undefined)).toBe(false);
		});
	});
}
