import Login
import RocketList
import UIToolkit
import XCTest

struct RocketLaunchScreen: Screen {
  let app: XCUIApplication

  private let     launchDistanceText: XCUIElement

  init(app: XCUIApplication) {
    self.app = app

    launchDistanceText = app.staticTexts[AccessibilityKeys.RocketLaunch.launchDistanceStaticText]
  }

  @discardableResult
  func checkLaunchDistanceText() -> Self {
    XCTAssert(launchDistanceText.waitForExistence(timeout: Timeouts.defaultTimeout))
    return self
  }
}
