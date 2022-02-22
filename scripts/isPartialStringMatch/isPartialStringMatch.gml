function isPartialStringMatch(potentialMatches, partialString) {
	var maybeMatch = array_find(potentialMatches,
		function(potentialMatch, testParam) {
			return string_pos(testParam, potentialMatch) > 0;
		},
		partialString);
	if (!is_undefined(maybeMatch)) {
		return true;
	}
	return false;
}
