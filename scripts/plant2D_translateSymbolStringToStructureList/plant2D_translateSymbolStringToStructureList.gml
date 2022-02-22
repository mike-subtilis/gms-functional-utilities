// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_translateSymbolStringToStructureList(symbolString) {
	var parsedSymbolStructureList = ds_list_create();
	for (var i = 0; i < string_length(symbolString); i++) {
		var symbol = string_char_at(symbolString, i + 1); // string_char_at is 1-indexed
		ds_list_add(parsedSymbolStructureList, new Plant2DSymbolInstance(symbol));
	}
	return parsedSymbolStructureList;
}
