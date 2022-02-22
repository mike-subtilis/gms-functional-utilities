// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_concat() {
	var totalCount = 0;
	for (var i = 0; i < argument_count; i++) {
		var argumentArray = argument[i];
		totalCount += array_length(argumentArray);
	}
	
	var concatArray = array_create(totalCount);
	var currentIndex = 0;
	for (var i = 0; i < argument_count; i++) {
		var argumentArray = argument[i];
		for (var j = 0; j < array_length(argumentArray); j++) {
			concatArray[currentIndex++] = argumentArray[j];
		}
	}
	return concatArray;
}