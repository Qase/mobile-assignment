import Login
import RocketList
import UIToolkit
import XCTest

struct LoginScreen: Screen {
  let app: XCUIApplication

  private let loginTitle: XCUIElement

  init(app: XCUIApplication) {
    self.app = app
    loginTitle = app.staticTexts[AccessibilityKeys.Login.title]
  }

  @discardableResult
  func checkLoginTitle() -> Self {
    XCTAssert(loginTitle.waitForExistence(timeout: 5))
    return self
  }
}
