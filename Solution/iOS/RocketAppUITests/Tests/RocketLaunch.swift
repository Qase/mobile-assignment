import XCTest

final class RocketLaunch: BaseTestCase {
  func testRocketLaunch() {
    LoginScreen(app: app)
      .checkLoginTitle()
      .enter(username: TestConstants.LoginCredentials.username)
      .enter(password: TestConstants.LoginCredentials.password)
      .tapLoginButton()
    RocketListScreen(app: app)
      .goToRocketDetail(index: 0)
    RocketDetailScreen(app: app)
      .checkRocketOverview()
      .tapLaunchButton()
    RocketLaunchScreen(app: app)
      .checkLaunchDistanceText()
  }
}
