import UIToolkit
import RocketList
import XCTest

struct RocketListScreen: Screen {
  let app: XCUIApplication
  
  private let rocketList: XCUIElement
  
  init(app: XCUIApplication) {
    self.app = app
    rocketList = app.descendants(matching: .any)[AccessibilityKeys.RocketList.list]
  }

  @discardableResult
  func checkRocketList() -> Self {
    XCTAssert(rocketList.waitForExistence(timeout: 5))
    return self
  }
}
