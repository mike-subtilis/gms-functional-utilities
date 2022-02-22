function variable_toJSON(variable){
	if (is_undefined(variable)) {
		return "";
	}
	if (is_array(variable)) {
		return array_toJSON(variable);
	}
	if (is_struct(variable)) {
		return struct_toJSON(variable);
	}

	if (is_string(variable)) {
		return "\"" + variable + "\"";
	}
	return string(variable);
}
