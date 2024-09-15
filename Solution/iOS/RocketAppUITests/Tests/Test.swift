import XCTest

final class Test: BaseTestCase {
  func testTest() {
    RocketListScreen(app: app)
      .checkRocketList()
  }
}
