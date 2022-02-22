function struct_deepEquals(a, b) {
	if (!is_struct(a) || !is_struct(b)) {
		return false;
	}
	var keysA = variable_struct_get_names(a);
	var keysB = variable_struct_get_names(b);
	if (!array_equals(keysA, keysB)) {
		return false;
	}
	for (var i = 0; i < array_length(keysA); i++) {
		var valueResult = variable_deepEquals(a[$ keysA[i]], b[$ keysA[i]]);
		if (!valueResult) {
			return false;
		}
	}
	return true;
}
