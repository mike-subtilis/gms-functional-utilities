function array_max(sourceArray) {
	if (array_length(sourceArray) == 0) {
		return undefined;
	}
	return array_reduce(sourceArray, function(memo, item) { if (memo < item) { return item; } return memo; }, sourceArray[0], { });
}
