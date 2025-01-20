import Login
import RocketList
import UIToolkit
import XCTest

struct RocketLaunchScreen: Screen {
  let app: XCUIApplication

  private let distanceToLaunchText: XCUIElement

  init(app: XCUIApplication) {
    self.app = app

    distanceToLaunchText = app.staticTexts[AccessibilityKeys.RocketLaunch.distanceToLaunchStaticText]
  }

  @discardableResult
  func checkRocketLaunchText() -> Self {
    XCTAssert(distanceToLaunchText.waitForExistence(timeout: Timeouts.defaultTimeout))
    return self
  }
}
