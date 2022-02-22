function struct_clone(source) {
	if (is_undefined(source)) {
		return undefined;
	}
	if (!is_struct(source)) {
		throw ("Expected a struct to be passed to struct_clone()");
	}
	var keys = variable_struct_get_names(source);
	var target = {};
	for (var i = 0; i < array_length(keys); i++) {
		target[$ keys[i]] = source[$ keys[i]];
	}
	return target;
}
