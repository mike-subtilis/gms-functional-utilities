function test_stack(_context) {
	context = _context;
	test_describe("ds_stack", context, function() {
		test_it("should return undefined when the stack is empty", context, function() {
			var sut = ds_stack_create();
			test_expect(ds_stack_top(sut)).toEqual(undefined);
		});
		test_it("should ", context, function() {
			test_expect(function() {
				var sut = ds_stack_create();
				ds_stack_push(sut, "abc");
				ds_stack_push(sut, "def");
				return ds_stack_top(sut);
			}).toEqual("def");
		});
	});
}
