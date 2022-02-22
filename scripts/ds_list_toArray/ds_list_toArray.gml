function ds_list_toArray(sourceList) {
	var targetArray = array_create(ds_list_size(sourceList));
	for (var i = 0; i < ds_list_size(sourceList); i++) {
		targetArray[i] = sourceList[| i];
	}
	return targetArray;
}