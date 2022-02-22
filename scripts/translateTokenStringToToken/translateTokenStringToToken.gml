function translateTokenStringToToken(tokenDefs, variableNames, newTokenString) {
	var maybeFunctionToken = array_find(tokenDefs,
		function(def, testParam) { return def.symbol == testParam; },
		newTokenString);
	if (!is_undefined(maybeFunctionToken)) {
		return maybeFunctionToken;
	}
	var maybeVariableName = array_find(variableNames,
		function(variableName, testParam) { return variableName == testParam; },
		newTokenString);
	if (!is_undefined(maybeVariableName)) {
		return new EquationTokenDef(newTokenString, tokenType.variable);
	}
	if (isNumberString(newTokenString)) {
		return new EquationTokenDef(real(newTokenString), tokenType.number);
	}
	throw ("Unknown token '" + newTokenString + "'.");
};
