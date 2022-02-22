// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Plant2DSystem(_symbols, _axiom) constructor {
	symbolDefs = array_create(array_length(_symbols));
	symbols = array_create(array_length(_symbols));
	for (var i = 0; i < array_length(_symbols); i++) {
		symbolDefs[i] = new Plant2DSymbolDefinition(_symbols[i]);	
		symbols[i] = symbolDefs[i].toString(); // ensure consistent format
	}

	axiom = _axiom;

	generation = {};
	rendering = {};
	turtle = {};

	createNewPlantInstance = function(_iterations) {
		var iterations = 0;
		if (!is_undefined(_iterations)) {
			iterations = _iterations;
		}
		var plantDefinition = plant2D_translateSymbolStringToStructureList(axiom);
		for (var i = 0; i < iterations; i++) {
			plantDefinition = plant2D_runIteration(system, plantDefinition);
		}
		return plantDefinition;
	};
	
	validate = function() {
		// check axiom

		// check each generation, rendering, and turtle rule for:
		//   source symbol is a valid symbol
		var generationKeys = variable_struct_get_names(generation);
		for (var i = 0; i < array_length(generationKeys); i++) {
			var rules = generation[$ generationKeys[i]].successors;
			for (var k = 0; k < ds_list_size(rules); k++) {
				var rule = rules[| k];
				var isValid = false;
				for (var j = 0; j < array_length(symbols); j++) {
					if (symbols[j] == rule.sourceSymbol) {
						isValid = true;
					}
				}
				if (!isValid) {
					throw (rule.toString() + " does not have a valid source symbol");
				}
			}
		}
	};
	
	toString = function() {
		var symbolsString = "";
		for (var i = 0; i < array_length(symbols); i++) {
			if (i == 0) {
				symbolsString = symbols[i];
			} else {
				symbolsString += ", " + symbols[i];
			}
		}
		
		var rulesString = "";
		var generationKeys = variable_struct_get_names(generation);
		for (var i = 0; i < array_length(generationKeys); i++) {
			var rules = generation[$ generationKeys[i]].successors;
			for (var j = 0; j < ds_list_size(rules); j++) {
				rulesString += rules[| j].toString() + "\n";
			}
		}
		return "symbols: " + symbolsString + "\n"
			+ "axiom: " + axiom + "\n"
			+ "rules: " + rulesString;
	};
}
