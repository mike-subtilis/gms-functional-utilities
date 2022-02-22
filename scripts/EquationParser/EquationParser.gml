function EquationParser(_standardVariableNames) constructor {
	infixOps = [
		new EquationOperatorTokenDef("+", tokenType.infixOperator, 2, 4, function(x, y) { return x + y; }),
		new EquationOperatorTokenDef("-", tokenType.infixOperator, 2, 4, function(x, y) { return x - y; }),
		new EquationOperatorTokenDef("*", tokenType.infixOperator, 2, 3, function(x, y) { return x * y; }),
		new EquationOperatorTokenDef("/", tokenType.infixOperator, 2, 3, function(x, y) { return x / y; }),
		new EquationOperatorTokenDef("^", tokenType.infixOperator, 2, 2.5, function(x, y) { return power(x, y); }),

		new EquationOperatorTokenDef("&&", tokenType.infixOperator, 2, 11, function(x, y) { if (x == 0 || y == 0) { return 0 } return 1; }),
		new EquationOperatorTokenDef("||", tokenType.infixOperator, 2, 12, function(x, y) { if (x != 0 || y != 0) { return 1 } return 0; }),
		new EquationOperatorTokenDef("<", tokenType.infixOperator, 2, 6, function(x, y) { if (x < y) { return 1 } return 0; }),
		new EquationOperatorTokenDef("<=", tokenType.infixOperator, 2, 6, function(x, y) { if (x <= y) { return 1 } return 0; }),
		new EquationOperatorTokenDef("==", tokenType.infixOperator, 2, 7, function(x, y) { if (x == y) { return 1 } return 0; }),
		new EquationOperatorTokenDef("!=", tokenType.infixOperator, 2, 7, function(x, y) { if (x != y) { return 1 } return 0; }),
		new EquationOperatorTokenDef(">=", tokenType.infixOperator, 2, 6, function(x, y) { if (x >= y) { return 1 } return 0; }),
		new EquationOperatorTokenDef(">", tokenType.infixOperator, 2, 6, function(x, y) { if (x > y) { return 1 } return 0; }),

		new EquationOperatorTokenDef("\\", tokenType.infixOperator, 2, 3, function(x, y) { return x div y; }),
		new EquationOperatorTokenDef("%", tokenType.infixOperator, 2, 3, function(x, y) { return x mod y; }),
	];
	prefixOps = [
		new EquationOperatorTokenDef("-", tokenType.prefixOperator, 1, 2, function(x) { return -x; }),
		new EquationOperatorTokenDef("!", tokenType.prefixOperator, 1, 2, function(x) { if (x == 0) { return 1; } return 0; }),
	];
	standardFunctions = [
		new EquationOperatorTokenDef("min", tokenType.functionName, 2, 1, function(x, y) { if (x < y) { return x; } return y; }),
		new EquationOperatorTokenDef("max", tokenType.functionName, 2, 1, function(x, y) { if (x > y) { return x; } return y; }),
		new EquationOperatorTokenDef("floor", tokenType.functionName, 1, 1, function(x) { return floor(x); }),
		new EquationOperatorTokenDef("ceil", tokenType.functionName, 1, 1, function(x) { return ceil(x); }),
		new EquationOperatorTokenDef("round", tokenType.functionName, 1, 1, function(x) { return round(x); }),
		new EquationOperatorTokenDef("random_range", tokenType.functionName, 2, 1, function(x, y) { return random_range(x, y); }),
	];
	standardVariableNames = _standardVariableNames;

	tokenize = function(equationString) {
		var currentContext = new EquationTokenizeContext(
			array_concat(infixOps, prefixOps, standardFunctions),
			standardVariableNames);
		for (var i = 0; i < string_length(equationString); i++) {
			var currentChar = string_char_at(equationString, i+1); // 1-indexed
			currentContext.handleChar(currentChar);
		}
		currentContext.clearWorkingToken();

		var result = ds_list_toArray(currentContext.tokens);
		currentContext.finalize();
		delete currentContext;

		return result;
	}

	translateToPostfix = function(tokens) {
		var postfixTokenList = ds_list_create();
		var operatorStack = ds_stack_create();
		for (var i = 0; i < array_length(tokens); i++) {
			var token = tokens[i];
			if (token.symbolTokenType == tokenType.number || token.symbolTokenType == tokenType.variable) {
				ds_list_add(postfixTokenList, token);
			} else if (token.symbolTokenType == tokenType.functionName
				|| token.symbolTokenType == tokenType.infixOperator
				|| token.symbolTokenType == tokenType.prefixOperator) {

				var topOfStack = ds_stack_top(operatorStack);
				while (!is_undefined(topOfStack)
					&& (topOfStack.precedence <= token.precedence)
					&& (topOfStack.symbolTokenType != tokenType.openParenthesis)) {
					ds_list_add(postfixTokenList, topOfStack);
					ds_stack_pop(operatorStack);
					topOfStack = ds_stack_top(operatorStack);
				}
				ds_stack_push(operatorStack, token);
			} else if (token.symbolTokenType == tokenType.openParenthesis) {
				ds_stack_push(operatorStack, token);
			} else if (token.symbolTokenType == tokenType.closeParenthesis) {
				var topOfStack = ds_stack_top(operatorStack);
				while (!is_undefined(topOfStack) && topOfStack.symbolTokenType != tokenType.openParenthesis) {
					ds_list_add(postfixTokenList, topOfStack);
					ds_stack_pop(operatorStack);
					topOfStack = ds_stack_top(operatorStack);
				}
				if (!is_undefined(topOfStack) && topOfStack.symbolTokenType == tokenType.openParenthesis) {
					ds_stack_pop(operatorStack);
					topOfStack = ds_stack_top(operatorStack);
				}
				if (!is_undefined(topOfStack) && topOfStack.symbolTokenType == tokenType.functionName) {
					ds_list_add(postfixTokenList, topOfStack);
					ds_stack_pop(operatorStack);
				}				
			}
		}

		var remainingOpStackToken = ds_stack_pop(operatorStack);
		while (!is_undefined(remainingOpStackToken)) {
			ds_list_add(postfixTokenList, remainingOpStackToken);
			remainingOpStackToken = ds_stack_pop(operatorStack);
		}
		
		var result = ds_list_toArray(postfixTokenList);
		ds_list_destroy(postfixTokenList);
		ds_stack_destroy(operatorStack);
		return result;
	}
		
	parse = function(equationString) {
		var tokens = tokenize(equationString);
		var postfixTokens = translateToPostfix(tokens);
		return new Equation(postfixTokens);
	}
}
