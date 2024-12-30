import XCTest

final class TestRocketLaunch: BaseTestCase {
  func testRocketLaunchTest() {

    LoginScreen(app: app)
      .checkLoginTitle()
      .enter(username: TestConstants.LoginCredentials.username)
      .enter(password: TestConstants.LoginCredentials.password)
      .tapLoginButton()
    RocketListScreen(app: app)
      .goToRocket(atIndex: 0)
    RocketDetailScreen(app: app)
      .checkRocketTitle()
      .tapLaunchButton()
    RocketLaunchScreen(app: app)
      .checkRocketLaunchText()
  }
}
