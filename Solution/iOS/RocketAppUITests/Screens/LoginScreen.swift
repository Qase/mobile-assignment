import Login
import RocketList
import UIToolkit
import XCTest

struct LoginScreen: Screen {
  let app: XCUIApplication

  private let loginTitle: XCUIElement
  private let usernameTextField: XCUIElement
  private let passwordSecureTextField: XCUIElement
  private let loginButton: XCUIElement

  init(app: XCUIApplication) {
    self.app = app
    loginTitle = app.staticTexts[AccessibilityKeys.Login.titleStaticText]
    usernameTextField = app.textFields[AccessibilityKeys.Login.usernameTextField]
    passwordSecureTextField = app.secureTextFields[AccessibilityKeys.Login.passwordSecureField]
    loginButton = app.buttons[AccessibilityKeys.Login.loginButton]
  }

  @discardableResult
  func checkLoginTitle() -> Self {
    XCTAssert(loginTitle.waitForExistence(timeout: Timeouts.defaultTimeout))
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
    XCTAssert(passwordSecureTextField.waitForExistence(timeout: Timeouts.defaultTimeout))
    passwordSecureTextField.tap()
    passwordSecureTextField.typeText(password)
    return self
  }

  @discardableResult
  func tapLoginButton() -> Self {
    XCTAssert(loginButton.waitForExistence(timeout: Timeouts.defaultTimeout))
    loginButton.tap()
    return self
  }
}
