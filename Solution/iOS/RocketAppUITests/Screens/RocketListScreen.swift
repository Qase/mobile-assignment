import Login
import RocketList
import UIToolkit
import XCTest

struct RocketListScreen: Screen {
  let app: XCUIApplication
  
  private let logoutButton: XCUIElement
  private let firstRocketCell: XCUIElement
  
  init(app: XCUIApplication) {
    self.app = app
    logoutButton = app.buttons[AccessibilityKeys.RocketList.logoutButton]
    firstRocketCell = app.cells[AccessibilityKeys.RocketList.rocketCell]
  }
  
  @discardableResult
  func checkLogoutButton() -> Self {
    XCTAssert(logoutButton.waitForExistence(timeout: 5))
    return self
  }
  
  @discardableResult
  func tapFirstRocketCell() -> Self {
    let rocketCells = app.buttons.matching(identifier: "rocketCell")
    let firstRocketCell = rocketCells.element(boundBy: 0)
    firstRocketCell.tap()
    return self
  }
}
