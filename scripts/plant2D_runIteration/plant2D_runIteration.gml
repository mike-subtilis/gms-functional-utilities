// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_runIteration(system, plantDefinition) {
	for (var i = 0; i < ds_list_size(plantDefinition); i++) {
		var symbolInfo = plantDefinition[| i];
		if (!symbolInfo.isActive) {
			// do nothing with this symbol
		} else if (is_undefined(system.generation[$ symbolInfo.symbol])) {
			// no successor, mark as inActive but do nothing additional
			symbolInfo.isActive = false;
		} else {
			var potentialSuccessors = system.generation[$ symbolInfo.symbol].successors;
			// 2nd param is context... should contain turtle, relevant world info, attractors, repellors...
			if (plant2D_isSymbolStillActive(symbolInfo, potentialSuccessors, { })) {
				var successorInfo = plant2D_chooseSuccessorInfo(potentialSuccessors, { });
				var calculatedSuccessorSymbols = plant2D_calculateSuccessorSymbols(symbolInfo, successorInfo);
				delete plantDefinition[| i];
				ds_list_delete(plantDefinition, i);
				for (var j = 0; j < ds_list_size(calculatedSuccessorSymbols); j++) {
					ds_list_insert(plantDefinition, i + j, calculatedSuccessorSymbols[| j]);
				}
				i += ds_list_size(calculatedSuccessorSymbols) - 1;
				ds_list_destroy(calculatedSuccessorSymbols);
			} else {
				symbolInfo.isActive = false;
			}
		}
	}
	return plantDefinition;
}
