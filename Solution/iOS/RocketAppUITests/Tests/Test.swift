import XCTest

final class Test: BaseTestCase {
  func testTest() {
    LoginScreen(app: app)
      .checkLoginTitle()
  }
}
