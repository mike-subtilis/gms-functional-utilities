function testAll_struct(_context) {
	test_struct_clone(_context);
	test_struct_deepEquals(_context);
	test_struct_extend(_context);
	test_struct_extendInPlace(_context);
	test_struct_matches(_context);
	test_struct_omit(_context);
	test_struct_pick(_context);
}
