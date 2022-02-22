function EquationOperatorTokenDef(_symbol, _tokenType, _parameterCount, _precedence, _apply) : EquationTokenDef(_symbol, _tokenType) constructor {
	parameterCount = _parameterCount;
	precedence = _precedence;
	apply = _apply;
}
