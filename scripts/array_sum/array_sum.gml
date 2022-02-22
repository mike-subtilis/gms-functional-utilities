function array_sum(sourceArray) {
	return array_reduce(sourceArray, function(memo, item) { return memo + item; }, 0, { });
}
