function struct_pick(source, fields){
	if (is_undefined(source)) {
		return undefined;
	}
	if (!is_struct(source)) {
		throw ("Expected a struct to be passed to struct_pick()");
	}
	var keys = variable_struct_get_names(source);
	var pickedKeys = array_intersection(keys, fields);
	var target = {};
	for (var i = 0; i < array_length(pickedKeys); i++) {
		target[$ pickedKeys[i]] = source[$ pickedKeys[i]];
	}
	return target;
}