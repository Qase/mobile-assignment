import Login
import RocketList
import UIToolkit
import XCTest

struct LoginScreen: Screen {
  let app: XCUIApplication

  private let title: XCUIElement
  private let usernameField: XCUIElement
  private let passwordField: XCUIElement
  private let loginButton: XCUIElement

  init(app: XCUIApplication) {
    self.app = app
    title = app.staticTexts[AccessibilityKeys.Login.titleStaticText]
    usernameField = app.textFields[AccessibilityKeys.Login.usernameTextField]
    passwordField = app.secureTextFields[AccessibilityKeys.Login.passwordSecureField]
    loginButton = app.buttons[AccessibilityKeys.Login.loginButton]
  }

  @discardableResult
  func checkLoginTitle() -> Self {
    XCTAssert(title.waitForExistence(timeout: Timeouts.defaultTimeout))
    return self
  }

  @discardableResult
  func enter(username: String) -> Self {
    XCTAssert(usernameField.waitForExistence(timeout: Timeouts.defaultTimeout))
    usernameField.tap()
    usernameField.typeText(username)
    return self
  }

  @discardableResult
  func enter(password: String) -> Self {
    XCTAssert(passwordField.waitForExistence(timeout: Timeouts.defaultTimeout))
    passwordField.tap()
    passwordField.typeText(password)
    return self
  }

  @discardableResult
  func tapLoginButton() -> Self {
    XCTAssert(loginButton.waitForExistence(timeout: Timeouts.defaultTimeout))
    loginButton.tap()
    return self
  }
}
