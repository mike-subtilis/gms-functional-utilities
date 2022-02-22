function variable_deepEquals(a, b) {
	if (is_array(b)) {
		return array_deepEquals(a, b);
	}
	if (is_struct(b)) {
		return struct_deepEquals(a, b);
	}
	return a == b;
}
