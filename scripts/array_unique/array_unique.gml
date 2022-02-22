function array_unique(sourceArray) {
	var uniqueCharMap = ds_map_create();
	var uniqueArray = [];
	var uniqueIndex = 0;
	for (var i = 0; i < array_length(sourceArray); i++) {
		if (!uniqueCharMap[? sourceArray[i]]) {
			uniqueCharMap[? sourceArray[i]] = true;
			uniqueArray[uniqueIndex++] = sourceArray[i];
		}
	}
	ds_map_destroy(uniqueCharMap);
	return uniqueArray;
}
