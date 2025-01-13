import Login
import RocketList
import UIToolkit
import XCTest

struct RocketListScreen: Screen {
  let app: XCUIApplication

  private let arrowImage: XCUIElementQuery

  init(app: XCUIApplication) {
    self.app = app

    arrowImage = app.images.matching(identifier: AccessibilityKeys.RocketListCell.arrowImage)
  }

  @discardableResult
  func goToRocketDetail(index: Int) -> Self {
    let rocket = arrowImage.element(boundBy: index)
    XCTAssert(rocket.waitForExistence(timeout: Timeouts.defaultTimeout))
    rocket.tap()
    return self
  }
}
