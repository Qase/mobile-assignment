import Login
import RocketList
import UIToolkit
import XCTest

struct RocketListScreen: Screen {
  let app: XCUIApplication

  private let rocketCells: XCUIElementQuery
  private let rocketNames: XCUIElementQuery
  private let rocketCellArrows: XCUIElementQuery
  
  init(app: XCUIApplication) {
    self.app = app
    
    rocketCells = app.buttons.matching(identifier: AccessibilityKeys.RocketList.rocketCell)
    rocketNames = app.staticTexts.matching(identifier: AccessibilityKeys.RocketListCell.rocketNameLabel)
    rocketCellArrows = app.images.matching(identifier: AccessibilityKeys.RocketListCell.rocketCellArrow)
  }

  @discardableResult
  func countRocketCells() -> Self {
    XCTAssert(rocketCells.firstMatch.waitForExistence(timeout: 5), "Rocket cells did not appear within the timeout.")
    print("Number of rocket cells displayed: \(rocketCells.count)")
    XCTAssert(rocketCells.count == 4, "Expected exactly 4 rocket cells to be displayed.")
    return self
  }
  
  @discardableResult
  func checkRocketNames(_ expectedRocketNames: [String]) -> Self {
    for index in 0..<rocketNames.count {
      let rocketName = rocketNames.element(boundBy: index)
      let expectedRocketName = expectedRocketNames[index]
      XCTAssert(
        rocketName.label == expectedRocketName,
        "Rocket name at index \(index) does not match the expected value"
      )
    }
    return self
  }
  
  @discardableResult
  func tapFirstRocketCell() -> Self {
    let firstRocketCell = rocketCellArrows.element(boundBy: 0)
    firstRocketCell.tap()
    return self
  }
}
