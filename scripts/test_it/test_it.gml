function test_it(description, context, testFunction) {
	var suiteContext = context;
	if (is_undefined(context)) {
		suiteContext = new TestContext();
	}
	suiteContext.startSuite(description);

	try {
		testFunction();
		suiteContext.addSuccess();
	} catch (ex) {
		suiteContext.addFailure(ex);
	} finally {
		suiteContext.endSuite();
	}
}