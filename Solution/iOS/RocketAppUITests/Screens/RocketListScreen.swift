import Login
import RocketList
import UIToolkit
import XCTest

struct RocketListScreen: Screen {
  let app: XCUIApplication

  private let rocketCells: XCUIElementQuery
  private let rocketNameLabels: XCUIElementQuery
  private let rocketCellArrows: XCUIElementQuery
  
  init(app: XCUIApplication) {
    self.app = app
    
    rocketCells = app.buttons.matching(identifier: AccessibilityKeys.RocketList.rocketCell)
    rocketNameLabels = app.staticTexts.matching(identifier: AccessibilityKeys.RocketListCell.rocketNameLabel)
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
  func checkRocketNames() -> Self {
    let expectedRocketNames = ["Falcon 1", "Falcon 9", "Falcon Heavy", "Starship"]
    for index in 0..<rocketCells.count {
     let rocketName = rocketNameLabels.element(boundBy: index)
      let expectedRocketName = expectedRocketNames[index]
      XCTAssert(rocketName.label == expectedRocketName,
                "Rocket name \(expectedRocketName) does not match the expected value.")
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
