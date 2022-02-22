// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Plant2DGenerationRule(_sourceSymbol, _successorString, _weight) constructor {
	sourceSymbolDef = new Plant2DSymbolDefinition(_sourceSymbol);
	sourceSymbol = sourceSymbolDef.toString();

	successor = _successorString;
	var parsedSuccessorSymbolInfoList = plant2D_translateSymbolStringToStructureList(successor);
	successorSymbolInfoList = parsedSuccessorSymbolInfoList;
	if (is_undefined(_weight)) {
		weight = 1;
	} else {
		weight = _weight;
	}

	toString = function() {
        return sourceSymbol + " = " + successor;
    }
}
