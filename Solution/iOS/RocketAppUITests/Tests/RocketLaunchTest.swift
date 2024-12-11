import XCTest

final class TestRocketLaunch: BaseTestCase {
  func testRocketLaunchTest() {
    let username = "astronaut1"
    let password = "space"
    
    LoginScreen(app: app)
      .checkLoginTitle()
      .enterUsername(username)
      .enterPassword(password)
      .tapLoginButton()
    RocketListScreen(app: app)
      .countRocketCells()
      .checkRocketNames()
      .tapFirstRocketCell()
    RocketDetailScreen(app: app)
      .checkRocketTitle()
      .tapLaunchButton()
    RocketLaunchScreen(app: app)
      .checkRocketImage()
  }
}
