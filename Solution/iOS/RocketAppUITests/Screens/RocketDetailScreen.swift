import Login
import RocketList
import UIToolkit
import XCTest

struct RocketDetailScreen: Screen {
  let app: XCUIApplication

  private let titleStaticText: XCUIElement
  private let launchButton: XCUIElement

  init(app: XCUIApplication) {
    self.app = app
    titleStaticText = app.staticTexts[AccessibilityKeys.RocketDetail.titleStaticText]
    launchButton = app.navigationBars.buttons[AccessibilityKeys.RocketDetail.launchButton]
  }

  @discardableResult
  func checkRocketTitle() -> Self {
    XCTAssert(titleStaticText.waitForExistence(timeout: Timeouts.defaultTimeout))
    return self
  }

  @discardableResult
  func tapLaunchButton() -> Self {
    XCTAssert(launchButton.waitForExistence(timeout: Timeouts.defaultTimeout))
    launchButton.tap()
    return self
  }
}
