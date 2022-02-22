// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plant2D_chooseSuccessorInfo(potentialSuccessors, additionalContext) {
	var successorCalculatedWeight;
	var totalWeight = 0;
	for (var j = 0; j < ds_list_size(potentialSuccessors); j++) {
		if (is_method(potentialSuccessors[| j].weight)) {
			successorCalculatedWeight[j] = potentialSuccessors[| j].weight(additionalContext);
		} else {
			successorCalculatedWeight[j] = potentialSuccessors[| j].weight;
		}
		totalWeight += successorCalculatedWeight[j];
	}
	var randomSuccessorWeight = random(totalWeight);
	var runningWeight = 0;
	for (var j = 0; j < ds_list_size(potentialSuccessors); j++) {
		runningWeight += successorCalculatedWeight[j];
		if (randomSuccessorWeight <= runningWeight) {
			return potentialSuccessors[| j];
		}
	}
	
	show_debug_message("[WARN] No successor was found");
	return undefined;
}
