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
  func goToRocket(atIndex index: Int) -> Self {
    let firstRocketCell = rocketCellArrows.element(boundBy: index)
    XCTAssert(firstRocketCell.waitForExistence(timeout: TestConstants.Timeouts.defaultTimeout))
    firstRocketCell.tap()
    return self
  }
}
