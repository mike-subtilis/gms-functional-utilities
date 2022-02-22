/// parse a "regex" (very particular for our purposes)
function plant2D_parseRegex(regexDef, testString) {
	/* 	[
		{ match: "\w", minTimes: 1, maxTimes: 1 }, // symbol
		{
			minTimes: 0,
			maxTimes: 1,
			match: [
				{ match: "(", minTimes: 1, maxTimes: 1 },
				{ match: "\w", minTimes: 1, maxTimes: 1 }, // parameters
				{
					minTimes: 0,
					maxTimes: 100,
					match: [
						{ match: ",", minTimes: 1, maxTimes: 1 },
						{ match: "\w", minTimes: 1, maxTimes: 1 }, // parameters
					],
				},
				{ match: ")", minTimes: 1, maxTimes: 1 },
			],
		},
	]; */
	for (var i = 0; i < array_length(regexDef); i++) {
		
	}
}

function plant2D_parseRegexComponent(matchTarget, testString) {
	// { match: "\w", minTimes: 1, maxTimes: 1 }
	
}
