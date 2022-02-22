function isWordChar(character) {
	return ("A" <= character && character <= "Z")
		|| ("a" <= character && character <= "z")
		|| ("0" <= character && character <= "9")
		|| (character == "_");
}
