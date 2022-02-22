function EquationTokenDef(_symbol, _tokenType) constructor {
	enum tokenType {
		functionName,
		infixOperator,
		prefixOperator,
		number,
		variable,
		openParenthesis,
		closeParenthesis,
	};

	symbol = _symbol;
	symbolTokenType = _tokenType;
}
