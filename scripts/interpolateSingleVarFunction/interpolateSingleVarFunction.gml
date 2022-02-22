// knownPoints = [{ x, y }]
function interpolateSingleVarFunction(knownPoints, x) {
	var foundPoint = array_find(knownPoints, function(p, params) { return p.x == params.x; }, { x: x });
	if (foundPoint != undefined) {
		return foundPoint.y;
	}

	var closestPointBelowIndex = -1;
	var closestPointAboveIndex = -1;
	var closestPointBelowDiff = 2000000;
	var closestPointAboveDiff = -2000000;
	for (var i = 0; i < array_length(knownPoints); i++) {
		var diff = x - knownPoints[i].x;
		if (diff > 0 && diff < closestPointBelowDiff) {
			closestPointBelowIndex = i;
			closestPointBelowDiff = diff;
		}
		if (diff < 0 && diff > closestPointAboveDiff) {
			closestPointAboveIndex = i;
			closestPointAboveDiff = diff;
		}
	}
	if (closestPointBelowIndex >= 0) {
		if (closestPointAboveIndex >= 0) {
			var below = knownPoints[closestPointBelowIndex];
			var above = knownPoints[closestPointAboveIndex];
			
			var progress = (x - below.x) / (above.x - below.x);
			return below.y + progress * (above.y - below.y);			
		} else {
			return knownPoints[closestPointBelowIndex].y;
		}
	} else if (closestPointAboveIndex >= 0) {
		return knownPoints[closestPointAboveIndex].y;
	}
	return undefined;
}
