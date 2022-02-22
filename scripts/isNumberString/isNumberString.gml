function isNumberString(maybeNumberString) {
	if (string_char_at(maybeNumberString, 1) == "+") {
		return false; // we don't allow +123
	}
	try {
		var maybeNumber = real(maybeNumberString);
		return is_numeric(maybeNumber);
	} catch(ex) {
		return false;
	}
}
