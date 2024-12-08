import Login
import RocketList
import UIToolkit
import XCTest

struct RocketListScreen: Screen {
  let app: XCUIApplication

  private let rocketCells: XCUIElementQuery
  private let rocketCellArrow: XCUIElementQuery
  
  init(app: XCUIApplication) {
    self.app = app

    rocketCells = app.buttons.matching(identifier: "rocketCellsID")
    rocketCellArrow = app.images.matching(identifier: "rocketCellArrowID")
    
  }

  @discardableResult
    func countRocketCells() -> Self {
        let exists = rocketCells.firstMatch.waitForExistence(timeout: 5)
        XCTAssertTrue(exists, "Rocket cells did not appear within the timeout.")

        let cellCount = rocketCells.count
        print("Number of rocket cells displayed: \(cellCount)")

        XCTAssertEqual(cellCount, 4, "Expected exactly 4 rocket cells to be displayed.")

        return self
    }
  
  @discardableResult
  func tapFirstRocketCell() -> Self {
    let firstRocketCell = rocketCellArrow.element(boundBy: 0)
    
    firstRocketCell.tap()
    
    return self
  }
}
