import Login
import RocketList
import UIToolkit
import XCTest

struct RocketLaunchScreen: Screen {
  let app: XCUIApplication

  private let titleStaticText: XCUIElement

  init(app: XCUIApplication) {
    self.app = app

    titleStaticText = app.staticTexts[AccessibilityKeys.RocketLaunch.titleStaticText]
  }

  @discardableResult
  func checkRocketLaunchText() -> Self {
    XCTAssert(titleStaticText.waitForExistence(timeout: Timeouts.defaultTimeout))
    return self
  }
}
