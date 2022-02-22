function array_intersection(array1, array2) {
	var arrayFieldMap = ds_map_create();
	for (var i = 0; i < array_length(array2); i++) {
		arrayFieldMap[? array2[i]] = 1;
	}
	var intersectionList = ds_list_create();
	for (var i = 0; i < array_length(array1); i++) {
		if (arrayFieldMap[? array1[i]] == 1) {
			ds_list_add(intersectionList, array1[i]);
		}
	}

	var intersectionArray = ds_list_toArray(intersectionList);
	ds_map_destroy(arrayFieldMap);
	ds_list_destroy(intersectionList);
	return intersectionArray;
}
