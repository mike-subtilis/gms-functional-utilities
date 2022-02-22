// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_calculateSuccessorSymbols(currentSymbolInfo, successorInfo){
	// needs to return a list of symbol info
	var newList = ds_list_create();
	for (var i = 0; i < ds_list_size(successorInfo.successorSymbolInfoList); i++) {
		newList[| i] = new Plant2DSymbolInstance(successorInfo.successorSymbolInfoList[| i].symbol);
	}
	return newList;
}
