function array_toList(sourceArray) {
	var destinationList = ds_list_create();
	for (var i = 0; i < array_length(sourceArray); i++) {
		ds_list_add(destinationList, sourceArray[i]);
	}
	return destinationList;
}
