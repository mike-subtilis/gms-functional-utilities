function array_deepEquals(a, b) {
	if (!is_array(a) || !is_array(b)) {
		return false;
	}

	if (array_length(a) != array_length(b)) {
		return false;
	}
	for (var i = 0; i < array_length(a); i++) {
		var valueResult = variable_deepEquals(a[i], b[i]);
		if (!valueResult) {
			return false;
		}
	}
	return true;
}
