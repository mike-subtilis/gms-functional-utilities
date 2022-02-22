function TestContext() constructor {
	numberRun = 0;
	numberPassed = 0;
	numberFailed = 0;
	descriptionStack = ds_list_create(); // use a list rather than stack because we need random access

	function startSuite(_suiteDescription) {
		ds_list_add(descriptionStack, _suiteDescription);
	}
	
	function addSuccess() {
		numberRun++;
		numberPassed++;
	}

	function addFailure(failureMessage) {
		numberRun++;
		numberFailed++;

		var totalDescription = "";
		for (var i = 0; i < ds_list_size(descriptionStack); i++) {
			totalDescription += descriptionStack[| i] + " ";
		}
		show_debug_message(totalDescription + ": " + failureMessage);
	}

	function endSuite() {
		ds_list_delete(descriptionStack, ds_list_size(descriptionStack) - 1);
	}
}
