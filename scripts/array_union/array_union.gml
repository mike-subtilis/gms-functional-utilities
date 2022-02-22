function array_union(array1, array2) {
	var arrayFieldMap = ds_map_create();
	var unionList = ds_list_create();
	for (var i = 0; i < array_length(array1); i++) {
		if (is_undefined(arrayFieldMap[? array1[i]])) {
			arrayFieldMap[? array1[i]] = 1;
			ds_list_add(unionList, array1[i]);
		}
	}
	for (var i = 0; i < array_length(array2); i++) {
		if (is_undefined(arrayFieldMap[? array2[i]])) {
			arrayFieldMap[? array2[i]] = 1;
			ds_list_add(unionList, array2[i]);
		}
	}

	var unionArray = ds_list_toArray(unionList);
	ds_map_destroy(arrayFieldMap);
	ds_list_destroy(unionList);
	return unionArray;
}
