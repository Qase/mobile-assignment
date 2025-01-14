import Login
import RocketList
import UIToolkit
import XCTest

struct RocketLaunchScreen: Screen {
  let app: XCUIApplication

  private let title: XCUIElement

  init(app: XCUIApplication) {
    self.app = app

    title = app.staticTexts[AccessibilityKeys.RocketLaunch.titleStaticText]
  }

  @discardableResult
  func checkRocketLaunchText() -> Self {
    XCTAssert(title.waitForExistence(timeout: Timeouts.defaultTimeout))
    return self
  }
}
