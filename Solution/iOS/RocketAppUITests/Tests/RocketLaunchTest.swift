import XCTest

final class TestRocketLaunch: BaseTestCase {
  func testRocketLaunchTest() {

    LoginScreen(app: app)
      .checkLoginTitle()
      .enterUsername(TestConstants.LoginDetails.username)
      .enterPassword(TestConstants.LoginDetails.password)
      .tapLoginButton()
    RocketListScreen(app: app)
      .countRocketCells()
      .checkRocketNames(TestConstants.Rockets.rocketNames)
      .tapFirstRocketCell()
    RocketDetailScreen(app: app)
      .checkRocketTitle()
      .tapLaunchButton()
    RocketLaunchScreen(app: app)
      .checkRocketImage()
  }
}
