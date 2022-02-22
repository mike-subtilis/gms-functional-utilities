function struct_omit(source, fieldsToOmit){
	if (is_undefined(source)) {
		return undefined;
	}
	if (!is_struct(source)) {
		throw ("Expected a struct to be passed to struct_pick()");
	}
	var keys = variable_struct_get_names(source);
	var remainingKeys = array_without(keys, fieldsToOmit);
	var target = {};
	for (var i = 0; i < array_length(remainingKeys); i++) {
		target[$ remainingKeys[i]] = source[$ remainingKeys[i]];
	}
	return target;
}