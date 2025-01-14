import Login
import RocketList
import UIToolkit
import XCTest

struct RocketDetailScreen: Screen {
  let app: XCUIApplication

  private let title: XCUIElement
  private let launchButton: XCUIElement

  init(app: XCUIApplication) {
    self.app = app
    title = app.staticTexts[AccessibilityKeys.RocketDetail.titleStaticText]
    launchButton = app.navigationBars.buttons[AccessibilityKeys.RocketDetail.launchButton]
  }

  @discardableResult
  func checkRocketTitle() -> Self {
    XCTAssert(title.waitForExistence(timeout: Timeouts.defaultTimeout))
    return self
  }

  @discardableResult
  func tapLaunchButton() -> Self {
    XCTAssert(launchButton.waitForExistence(timeout: Timeouts.defaultTimeout))
    launchButton.tap()
    return self
  }
}
