function Equation(_postfixTokens) constructor {
	postfixTokens = _postfixTokens;
	
	evaluate = function(variableValueMap) {
		var operandStack = ds_stack_create();
		
		for (var i = 0; i < array_length(postfixTokens); i++) {
			var token = postfixTokens[i];
			if (token.symbolTokenType == tokenType.number) {
				ds_stack_push(operandStack, token.symbol); // symbol is already a number
			} else if (token.symbolTokenType == tokenType.variable) {
				var varValue = variableValueMap[$ token.symbol];
				ds_stack_push(operandStack, varValue);
			} else if (token.symbolTokenType == tokenType.functionName
				|| token.symbolTokenType == tokenType.infixOperator
				|| token.symbolTokenType == tokenType.prefixOperator) {
				var parameters = array_create(token.parameterCount);
				for (var j = 0; j < token.parameterCount; j++) {
					parameters[token.parameterCount - j - 1] = ds_stack_pop(operandStack);
				}
				if (token.parameterCount == 1) {
					ds_stack_push(operandStack, token.apply(parameters[0]));
				} else if (token.parameterCount == 2) {
					ds_stack_push(operandStack, token.apply(parameters[0], parameters[1]));
				} else if (token.parameterCount == 3) {
					ds_stack_push(operandStack, token.apply(parameters[0], parameters[1], parameters[2]));
				} else if (token.parameterCount == 4) {
					ds_stack_push(operandStack, token.apply(parameters[0], parameters[1], parameters[2], parameters[3]));
				} else {
					throw ("Only 1->4 parameters are supported for functions: " + token.symbol + " expects " + string(token.parameterCount));
				}
			} else {
				throw ("Unsupported token type " + string(token.symbolTokenType));
			}
		}
		if (ds_stack_size(operandStack) == 0) {
			ds_stack_destroy(operandStack);
			return undefined;
		} else if (ds_stack_size(operandStack) > 1) {
			ds_stack_destroy(operandStack);
			throw ("Equation produced multiple values");
		} else {
			var finalResult = ds_stack_pop(operandStack);
			ds_stack_destroy(operandStack);
			return finalResult;
		}
	}
}
