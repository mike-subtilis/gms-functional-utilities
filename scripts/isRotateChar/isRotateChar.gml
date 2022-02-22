function isRotateChar(character) {
	var rotateSymbols = ["+", "-", "/", "\\", "^", "&", "~", "|"];
	for (var i = 0; i < array_length(rotateSymbols); i++) {
		if (rotateSymbols[i] == character) {
			return true;
		}
	}
	return false;
}
