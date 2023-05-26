import ComposableArchitecture
import ComposableCoreMotion
@testable import RocketDetail
import RocketsClient
import XCTest

final class RocketDetailTests: XCTestCase {
  let store = TestStore(
    initialState: RocketDetailCore.State(rocketData: RocketDetail.mock),
    reducer: RocketDetailCore()
  )

  func test_flow_rocketLaunchTapped_to_navigate() async {
    store.dependencies.motionClient = .unimplemented(
      create: { _ in .fireAndForget {} },
      destroy: { _ in .fireAndForget {} },
      startDeviceMotionUpdates: { _, _, _ in .fireAndForget {} },
      stopDeviceMotionUpdates: { _ in .fireAndForget {} }
    )

    await store.send(.rocketLaunchTapped) {
      $0.route = .rocketLaunchState(.init(rocketData: RocketDetail.mock))
    }

    await store.send(.setNavigation(isActive: true))

    await store.send(.setNavigation(isActive: false))

    await store.receive(.rocketLaunch(.onDisappear)) {
      $0.route = nil
    }
  }

  func test_setToUSMetrics_tapped() {
    XCTAssertFalse(store.state.isUSMetrics)
    store.send(.setToUSMetrics) {
      $0.isUSMetrics = true
    }
  }
}
