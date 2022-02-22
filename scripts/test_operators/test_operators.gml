function test_operators(_context) {
	context = _context;
	test_describe("==", context, function() {
		test_it("string == number", context, function() {
			// I don't like this, but it's a good reminder of how gamemaker works
			test_expect(9.81 == "9.81").toBe(true);
		});
	});
}