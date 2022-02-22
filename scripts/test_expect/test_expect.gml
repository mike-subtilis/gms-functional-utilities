// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function test_expect(_actual) {
	var internalThrewException = false;
	var actualValue = _actual;
	if (is_method(_actual)) {
		try {
			actualValue = _actual();
		} catch(ex) {
			internalThrewException = true;
			actualValue = ex;
		}
	}
	var testObj = {
		threwException: internalThrewException,
		actual: actualValue,
		toBe: function(_expected) {
			if ((actual != _expected)) {
				throw ("Expected " + variable_toJSON(actual) + " to be " + variable_toJSON(_expected));
			}
		},
		toEqual: function(_expected) {
			if (!variable_deepEquals(actual, _expected)) {
				throw ("Expected " + variable_toJSON(actual) + " to equal " + variable_toJSON(_expected));
			}
		},
		toThrow: function(_expected) {
			if (!threwException) {
				throw ("Expected test to throw an exception");
			}
			if (!is_undefined(_expected) && !variable_deepEquals(actual, _expected)) {
				throw ("Expected test to throw " + variable_toJSON(_expected) + " but threw " + variable_toJSON(actual));
			}
		},
		notToBe: function(_expected) {
			if (actual == _expected) {
				throw ("Expected " + variable_toJSON(actual) + " not to be " + variable_toJSON(_expected));
			}
		},
		notToEqual: function(_expected) {
			if (variable_deepEquals(actual, _expected)) {
				throw ("Expected " + variable_toJSON(actual) + " not to equal " + variable_toJSON(_expected));
			}
		},
	};
	return testObj;
}
