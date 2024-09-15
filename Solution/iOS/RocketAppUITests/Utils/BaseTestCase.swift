import XCTest

class BaseTestCase: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments = ["UITestMode", "testsFreshRun"]
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }
}
