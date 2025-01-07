import Login
import RocketList
import UIToolkit
import XCTest

struct RocketListScreen: Screen {
  let app: XCUIApplication

  private let rocketCellArrows: XCUIElementQuery

  init(app: XCUIApplication) {
    self.app = app

    rocketCellArrows = app.images.matching(identifier: AccessibilityKeys.RocketListCell.rocketArrowImage)
  }

  @discardableResult
  func goToRocketDetail(index: Int) -> Self {
    let rocketArrow = rocketCellArrows.element(boundBy: index)
    XCTAssert(rocketArrow.waitForExistence(timeout: Timeouts.defaultTimeout))
    rocketArrow.tap()
    return self
  }
}
