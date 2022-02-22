// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_isSymbolStillActive(currentSymbolInfo, potentialSuccessors, additionalContext) {
	var potentialSuccessorsWithWeight = 0;
	var potentialSuccessor;
	for (var j = 0; j < ds_list_size(potentialSuccessors); j++) {
		var calculatedWeight;
		if (is_method(potentialSuccessors[| j].weight)) {
			calculatedWeight = potentialSuccessors[| j].weight(additionalContext);
		} else {
			calculatedWeight = potentialSuccessors[| j].weight;
		}
		if (calculatedWeight > 0) {
			potentialSuccessorsWithWeight++;
			potentialSuccessor = potentialSuccessors[| j];
		}
	}
	if (potentialSuccessorsWithWeight == 0) {
		return false;
	} else if (potentialSuccessorsWithWeight == 1) {
		if (ds_list_size(potentialSuccessor.successorSymbolInfoList) == 1) {
			if (currentSymbolInfo.symbol == potentialSuccessor.successorSymbolInfoList[| 0].symbol) {
				return false;
			}
		}
	}
	return true;
}
