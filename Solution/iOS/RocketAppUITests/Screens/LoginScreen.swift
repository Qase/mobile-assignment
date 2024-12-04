import Login
import RocketList
import UIToolkit
import XCTest

struct LoginScreen: Screen {
  let app: XCUIApplication

  private let loginTitle: XCUIElement
  private let usernameField: XCUIElement
  private let passwordField: XCUIElement
  private let loginButton: XCUIElement

  init(app: XCUIApplication) {
    self.app = app
    loginTitle = app.staticTexts[AccessibilityKeys.Login.title]
    usernameField = app.textFields[AccessibilityKeys.Login.username]
    passwordField = app.secureTextFields[AccessibilityKeys.Login.password]
    loginButton = app.buttons[AccessibilityKeys.Login.loginButton]
  }

  @discardableResult
  func checkLoginTitle() -> Self {
    XCTAssert(loginTitle.waitForExistence(timeout: 5))
    return self
  }
  
  @discardableResult
  func enterUsername(_ username: String) -> Self {
    usernameField.tap()
    usernameField.typeText(username)
    return self
  }
  
  @discardableResult
  func enterPassword(_ password: String) -> Self {
    passwordField.tap()
    passwordField.typeText(password)
    return self
  }
  
  @discardableResult
  func tapLoginButton() -> Self {
    loginButton.tap()
    return self
  }

}
