function test_describe(description, context, suiteFunction) {
	var suiteContext = context;
	if (is_undefined(context)) {
		suiteContext = new TestContext();
	}
	suiteContext.startSuite(description);
	try {
		suiteFunction();
	} catch(ex) {
//		show_debug_message(ex);
		show_debug_message(description + ": " + ex);
		throw ex; // needs to be catastrophic or we won't record how many tests in this suite should have been run
	} finally {
		suiteContext.endSuite();
	}
}
