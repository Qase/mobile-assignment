import Login
import RocketList
import UIToolkit
import XCTest

struct RocketListScreen: Screen {
  let app: XCUIApplication

  private let rocketCells: XCUIElementQuery
  private let rocketCellArrows: XCUIElementQuery
  
  init(app: XCUIApplication) {
    self.app = app

    rocketCells = app.buttons.matching(identifier: AccessibilityKeys.RocketList.rocketCell)
    rocketCellArrows = app.images.matching(identifier: AccessibilityKeys.RocketListCell.rocketCellArrow)
  }

  @discardableResult
  func countRocketCells() -> Self {
    let cellCount = rocketCells.count
    
    XCTAssert(rocketCells.firstMatch.waitForExistence(timeout: 5), "Rocket cells did not appear within the timeout.")
    print("Number of rocket cells displayed: \(cellCount)")
    XCTAssertEqual(cellCount, 4, "Expected exactly 4 rocket cells to be displayed.")
    
    return self
    }
  
  @discardableResult
  func tapFirstRocketCell() -> Self {
    let firstRocketCell = rocketCellArrows.element(boundBy: 0)
    firstRocketCell.tap()
    
    return self
  }
}
