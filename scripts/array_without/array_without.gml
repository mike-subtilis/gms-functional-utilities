function array_without(sourceArray, valuesToRemove) {
	var targetList = ds_list_create();
	for (var i = 0; i < array_length(sourceArray); i++) {
		if (!array_contains(valuesToRemove, sourceArray[i])) {
			ds_list_add(targetList, sourceArray[i]);
		}
	}
	
	var targetArray = ds_list_toArray(targetList);
	ds_list_destroy(targetList);
	return targetArray;
}