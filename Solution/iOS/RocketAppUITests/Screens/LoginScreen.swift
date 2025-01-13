import Login
import RocketList
import UIToolkit
import XCTest

struct LoginScreen: Screen {
  let app: XCUIApplication

  private let titleStaticText: XCUIElement
  private let usernameTextField: XCUIElement
  private let passwordSecureField: XCUIElement
  private let loginButton: XCUIElement

  init(app: XCUIApplication) {
    self.app = app
    titleStaticText = app.staticTexts[AccessibilityKeys.Login.titleStaticText]
    usernameTextField = app.textFields[AccessibilityKeys.Login.usernameTextField]
    passwordSecureField = app.secureTextFields[AccessibilityKeys.Login.passwordSecureField]
    loginButton = app.buttons[AccessibilityKeys.Login.loginButton]
  }

  @discardableResult
  func checkLoginTitle() -> Self {
    XCTAssert(titleStaticText.waitForExistence(timeout: Timeouts.defaultTimeout))
    return self
  }

  @discardableResult
  func enter(username: String) -> Self {
    XCTAssert(usernameTextField.waitForExistence(timeout: Timeouts.defaultTimeout))
    usernameTextField.tap()
    usernameTextField.typeText(username)
    return self
  }

  @discardableResult
  func enter(password: String) -> Self {
    XCTAssert(passwordSecureField.waitForExistence(timeout: Timeouts.defaultTimeout))
    passwordSecureField.tap()
    passwordSecureField.typeText(password)
    return self
  }

  @discardableResult
  func tapLoginButton() -> Self {
    XCTAssert(loginButton.waitForExistence(timeout: Timeouts.defaultTimeout))
    loginButton.tap()
    return self
  }
}
