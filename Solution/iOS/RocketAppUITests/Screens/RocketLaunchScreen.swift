import Login
import RocketList
import UIToolkit
import XCTest

struct RocketLaunchScreen: Screen {
  let app: XCUIApplication

  private let rocketLaunchText: XCUIElement

  init(app: XCUIApplication) {
    self.app = app
    
    rocketLaunchText = app.staticTexts[AccessibilityKeys.RocketLaunch.rocketLaunchText]
  }

  @discardableResult
  func checkRocketLaunchText() -> Self {
    XCTAssert(rocketLaunchText.waitForExistence(timeout: TestConstants.Timeouts.defaultTimeout))
    return self
  }
}
