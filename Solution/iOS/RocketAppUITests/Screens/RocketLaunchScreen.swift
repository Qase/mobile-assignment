import Login
import RocketList
import UIToolkit
import XCTest

struct RocketLaunchScreen: Screen {
  let app: XCUIApplication
  
  private let rocketImage: XCUIElement
  
  init(app: XCUIApplication) {
    self.app = app
    rocketImage = app.images[AccessibilityKeys.RocketLaunch.rocketImage]

  }
  
  @discardableResult
  func checkRocketImage() -> Self {
    XCTAssert(rocketImage.waitForExistence(timeout: 5), "Rocket image did not appear within the timeout.")
    return self
  }
}
