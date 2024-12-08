import Login
import RocketList
import UIToolkit
import XCTest

struct RocketDetailScreen: Screen {
  let app: XCUIApplication
  
  private let rocketTitle: XCUIElement
  private let launchButton: XCUIElement
  
  init(app: XCUIApplication) {
    self.app = app
    rocketTitle = app.staticTexts[AccessibilityKeys.RocketDetail.rocketTitle]
    launchButton = app.navigationBars.buttons[AccessibilityKeys.RocketDetail.launchButton]
  }
  
  @discardableResult
  func checkRocketTitle() -> Self {
    XCTAssert(rocketTitle.waitForExistence(timeout: 5), "Rocket title did not appear within the timeout.")
    return self
  }
  @discardableResult
  func tapLaunchButton() -> Self {
    launchButton.tap()
    return self
  }
  
  
  

}
