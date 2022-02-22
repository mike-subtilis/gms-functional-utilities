function EquationTokenizeContext(_tokenDefs, _variables) constructor {
	openParenTokenDef = new EquationOperatorTokenDef("(", tokenType.openParenthesis, 0, 0, undefined);
	closeParenTokenDef = new EquationOperatorTokenDef(")", tokenType.closeParenthesis, 0, 0, undefined);

	// _tokenDefs = [EquationTokenDef]
	// _variables = [String] ... for now
	if (is_undefined(_tokenDefs)) {
		tokenDefs = [];
	} else {
		tokenDefs = _tokenDefs;
	}
	if (is_undefined(_variables)) {
		variables = [];
	} else {
		variables = _variables;
	}

	parenthesisCount = 0;
	workingTokenString = "";
	tokens = ds_list_create();
	lastToken = undefined;
		
	function clearWorkingToken() {
		if (string_length(workingTokenString) > 0) {
			var workingToken = translateTokenStringToToken(tokenDefs, variables, workingTokenString);
			ds_list_add(tokens, workingToken);
			lastToken = workingToken;
			workingTokenString = "";
		}
	}

	function handleChar(currentChar) {
		if (currentChar == "-") {
			clearWorkingToken();

			// infix "a - b" or prefix "-n"
			if (is_undefined(lastToken)
				|| lastToken.symbolTokenType == tokenType.infixOperator
				|| lastToken.symbolTokenType == tokenType.prefixOperator
				|| lastToken.symbolTokenType == tokenType.openParenthesis) {
				// prefix operator or number
				workingTokenString += currentChar;
			} else {
				// infix operator... we only handle 1... can't have "--" infix operator
				var potentialInfixOps = array_filter(tokenDefs, function(def) { return def.symbol == "-" && def.symbolTokenType == tokenType.infixOperator; }, undefined);
				if (array_length(potentialInfixOps) > 1) {
					throw ("Found more than 1 potential infix ops for '-'.");
				} else if (array_length(potentialInfixOps) == 0) {
					throw ("Found no infix operator definition for '-'.");
				}
				ds_list_add(tokens, potentialInfixOps[0]);
			}
		} else if (isOperatorChar(currentChar) || isLetterChar(currentChar)) {
			// part of an operator or function
			if (!isPartialStringMatch(array_pluck(tokenDefs, "symbol"), workingTokenString + currentChar)
				&& !isPartialStringMatch(variables, workingTokenString + currentChar)) {
				clearWorkingToken();
			}
			workingTokenString += currentChar;
		} else if (isNumberChar(currentChar)) {
			// numbers (e.g. 3, 3.14, -1.5)
			// part of a number
			if (!isNumberString(workingTokenString + currentChar)) {
				clearWorkingToken();
			}
			workingTokenString += currentChar;
		} else if (currentChar == " ") {
			// ignore this character but finish any other token
			clearWorkingToken();
		} else if (currentChar == ",") {
			clearWorkingToken();
			lastToken = undefined; // , effectively starts a new context
		} else if (currentChar == "(") {
			clearWorkingToken();
			parenthesisCount += 1;
			ds_list_add(tokens, openParenTokenDef);
			lastToken = openParenTokenDef;
		} else if (currentChar == ")") {
			if (parenthesisCount <= 0) {
				throw ("Mismatched parenthesis. Found an extra ')'.");
			}
			clearWorkingToken();
			parenthesisCount -= 1;
			ds_list_add(tokens, closeParenTokenDef);
			lastToken = closeParenTokenDef;
		}
	}

	function finalize() {
		ds_list_destroy(tokens);
	}
}
