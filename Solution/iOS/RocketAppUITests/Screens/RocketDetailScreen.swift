import Login
import RocketList
import UIToolkit
import XCTest

struct RocketDetailScreen: Screen {
  let app: XCUIApplication

  private let rocketOverview: XCUIElement
  private let launchButton: XCUIElement

  init(app: XCUIApplication) {
    self.app = app

    rocketOverview = app.staticTexts[AccessibilityKeys.RocketDetail.overviewStaticText]
    launchButton = app.navigationBars.buttons[AccessibilityKeys.RocketDetail.launchButton]
  }

  @discardableResult
  func checkRocketOverview() -> Self {
    XCTAssert(rocketOverview.waitForExistence(timeout: Timeouts.defaultTimeout))
    return self
  }

  @discardableResult
  func tapLaunchButton() -> Self {
    XCTAssert(launchButton.waitForExistence(timeout: Timeouts.defaultTimeout))
    launchButton.tap()
    return self
  }
}
