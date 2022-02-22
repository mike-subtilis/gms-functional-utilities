// tests to confirm ambiguous things in the official GML documentation
function testAll_gml(_context) {
	test_array_equals(_context);
	test_operators(_context);
	test_real(_context);
	test_stack(_context);
	test_typeof(_context);
}
