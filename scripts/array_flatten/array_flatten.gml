function array_flatten(sourceArrayOfArrays) {
	return array_reduce(sourceArrayOfArrays,
		function(memo, maybeArray) {
			if (is_array(maybeArray)) {
				return array_concat(memo, maybeArray);
			}
			return array_concat(memo, [maybeArray]);
		},
		[],
		{ });
}
