// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Plant2DSymbolDefinition(_symbolString) constructor {
	// form: "F", "G(a)", "H(x, y), +, -"
	// regex: ([A-Za-z0-9_+-...])(\([a-z](,[a-z])*\))?
	fullSymbolString = string_replace_all(_symbolString, " ", "");
	if (string_length(fullSymbolString) == 0) {
		throw ("Symbol definition must not be empty");
	}

	symbol = string_char_at(fullSymbolString, 1);
	if (!isSymbolChar(symbol)) {
		throw ("Symbol definition '" + symbol + "' should be an alphanumeric character or a valid symbol: _+-/\\^&!~");
	}

	if (string_length(fullSymbolString) == 1) {
		parameters = [];	
	}
	if (string_length(fullSymbolString) > 1) {
		var shouldBeOpenParen = string_char_at(fullSymbolString, 2);
		var shouldBeCloseParen = string_char_at(fullSymbolString, string_length(fullSymbolString));
		
		if (shouldBeOpenParen != "(" || shouldBeCloseParen != ")") {
			throw ("After the symbol definition, the remainder '" + fullSymbolString + "' should be enclosed in parenthesis.");
		}

		if (string_length(fullSymbolString) > 3) {
			parameters = array_create((string_length(fullSymbolString) - 4) / 2);	
		}
		for (var i = 3; i < string_length(fullSymbolString) - 1; i++) {
			var char = string_char_at(fullSymbolString, i);
			if (i % 2 == 0) {
				if (char != ",") {
					throw ("Symbol parameters should be a comma-delimited string.");
				}
			} else {
				if (!isParameterChar(char)) {
					throw ("Symbol parameters should be a comma-delimited string of lower-case letters.");
				}
				parameters[(i - 3) / 2] = char;
			}
		}
	}
	
	toString = function() {
		if (array_length(parameters) == 0) {
			return symbol;
		}
		var parametersAsCSV = "";
		for (var i = 0; i < array_length(parameters); i++) {
			if (i == 0) {
				parametersAsCSV = parameters[i];
			} else {
				parametersAsCSV = ", " + parameters[i];				
			}
		}
		return symbol + "(" + parametersAsCSV + ")";
	};
}
