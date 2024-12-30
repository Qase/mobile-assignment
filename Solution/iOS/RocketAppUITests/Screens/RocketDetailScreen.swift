import Login
import RocketList
import UIToolkit
import XCTest

struct RocketDetailScreen: Screen {
  let app: XCUIApplication

  private let rocketTitle: XCUIElement
  private let launchButton: XCUIElement

  init(app: XCUIApplication) {
    self.app = app
    rocketTitle = app.staticTexts[AccessibilityKeys.RocketDetail.rocketTitleText]
    launchButton = app.navigationBars.buttons[AccessibilityKeys.RocketDetail.launchButton]
  }

  @discardableResult
  func checkRocketTitle() -> Self {
    XCTAssert(rocketTitle.waitForExistence(timeout: TestConstants.Timeouts.defaultTimeout))
    return self
  }

  @discardableResult
  func tapLaunchButton() -> Self {
    XCTAssert(launchButton.waitForExistence(timeout: TestConstants.Timeouts.defaultTimeout))
    launchButton.tap()
    return self
  }
}
