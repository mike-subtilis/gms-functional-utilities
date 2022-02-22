function test_test_expect(_context) {
	context = _context;
	test_describe("expect()", context, function() {
		test_describe("toBe()", context, function() {
			test_it("number = number", context, function() {
				test_expect(9.81).toBe(9.81);
			});
			test_it("string = string", context, function() {
				test_expect("abc").toBe("abc");
			});
			test_it("array = array", context, function() {
				var sourceArray = [1, 2, 3];
				test_expect(sourceArray).toBe(sourceArray);
			});
			test_it("struct = struct", context, function() {
				var source = { x: 1, y: 2 };
				test_expect(source).toBe(source);
			});
		});
		test_describe("notToBe()", context, function() {
			test_it("number != different number", context, function() {
				test_expect(9.81).notToBe(9.82);
			});
			test_it("number == string", context, function() {
				test_expect(9.81).toBe("9.81"); // this is how GML works, so toBe() should be consistent
			});
			test_it("string != different string", context, function() {
				test_expect("abc").notToBe("def");
			});
			test_it("array != different array with the same values", context, function() {
				test_expect([1, 2, 3]).notToBe([1, 2, 3]);
			});
			test_it("struct != different struct with the same values", context, function() {
				test_expect({ x: 1, y: 2 }).notToBe({ x: 1, y: 2 });
			});
		});
		
		test_describe("toEqual()", context, function() {
			test_it("number = number", context, function() {
				test_expect(9.81).toEqual(9.81);
			});
			test_it("string = string", context, function() {
				test_expect("abc").toEqual("abc");
			});
			test_it("number == string", context, function() {
				test_expect(9.81).toEqual("9.81"); // staying consistent with GML 9.81 == "9.81"
			});
			test_it("array = array", context, function() {
				test_expect([1, 2, 3]).toEqual([1, 2, 3]);
			});
			test_it("struct = struct", context, function() {
				test_expect({ x: 1, y: 2 }).toEqual({ x: 1, y: 2 });
			});
			test_it("struct = struct in different order", context, function() {
				test_expect({ x: 1, y: 2 }).toEqual({ y: 2, x: 1 });
			});
		});

		test_describe("notToEqual()", context, function() {
			test_it("number != different number", context, function() {
				test_expect(9.81).notToEqual(9.82);
			});
			test_it("string != different string", context, function() {
				test_expect("abc").notToEqual("def");
			});
			test_it("array != array in different order", context, function() {
				test_expect([1, 2, 3]).notToEqual([3, 2, 1]);
			});
			test_it("struct != struct with different values", context, function() {
				test_expect({ x: 1, y: 2 }).notToEqual({ x: 1, y: 3 });
			});
		});
	});
}
