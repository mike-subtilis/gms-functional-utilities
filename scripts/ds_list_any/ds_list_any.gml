function ds_list_any(sourceList, testFunction, testParam) {
	for (var i = 0; i < ds_list_size(sourceList); i++) {
		if (testFunction(sourceList[| i], testParam)) {
			return true;
		}
	}
	return false;
}
