function test_interpolateSingleVarFunction(_context) {
	context = _context;
	knownPoints = [
		{ x: -20, y: 0 },
		{ x: -15, y: 0.05 },
		{ x: -10, y: 0.5 },
		{ x: 0, y: 0.9 },
		{ x: 10, y: 0.95 },
		{ x: 20, y: 1 },
	];
	test_describe("interpolateSingleVarFunction()", context, function() {
		test_it("should match exact values", context, function() {
			test_expect(interpolateSingleVarFunction(knownPoints, -20)).toEqual(0);
			test_expect(interpolateSingleVarFunction(knownPoints, -10)).toEqual(0.5);
			test_expect(interpolateSingleVarFunction(knownPoints, 20)).toEqual(1);
		});
		test_it("should interpolate values evenly between 2", context, function() {
			test_expect(interpolateSingleVarFunction(knownPoints, 15)).toEqual(0.975);
		});
		test_it("should interpolate values unevenly between 2", context, function() {
			test_expect(interpolateSingleVarFunction(knownPoints, -1)).toEqual(0.86);
		});
		test_it("should clamp values below", context, function() {
			test_expect(interpolateSingleVarFunction(knownPoints, -50)).toEqual(0);
		});
		test_it("should clamp values above", context, function() {
			test_expect(interpolateSingleVarFunction(knownPoints, 500)).toEqual(1);
		});
	});

}