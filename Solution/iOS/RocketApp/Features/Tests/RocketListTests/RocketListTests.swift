import Combine
import ComposableArchitecture
import NetworkClientExtensions
@testable import RocketList
import RocketsClient
import XCTest

final class RocketListTests: XCTestCase {
  var store = TestStore(initialState: RocketListCore.State(), reducer: RocketListCore())

  func test_flow_rocketListCell_cellTapped_to_navigate() {
    var state = RocketListCore.State()
    state.loadingStatus = .success(.init(arrayLiteral: .init(rocketData: RocketDetail.mock)))

    store = TestStore(initialState: state, reducer: RocketListCore())

    store.send(.rocketListCell(id: "apollo13", action: .cellTapped)) {
      $0.rocketDetail = .init(rocketData: RocketDetail.mock)
    }

    store.send(.rocketDetail(.dismiss)) {
      $0.rocketDetail = nil
    }
  }

  func test_flow_dataFetched_success() async {
    store.dependencies.rocketsClient.getAllRockets = { [RocketDetail.mock] }

    store.dependencies.mainQueue = .immediate

    await store.send(.fetchData) { $0.loadingStatus = .loading }

    await store.receive(.dataFetched(.success([RocketDetail.mock]))) {
      $0.loadingStatus = .success(.init(arrayLiteral: .init(rocketData: RocketDetail.mock)))
    }
  }

  func test_flow_dataFetched_failure() async {
    store.dependencies.rocketsClient.getAllRockets = { throw RocketsClientAsyncError.modelConversionError }

    store.dependencies.mainQueue = DispatchQueue.immediate.eraseToAnyScheduler()

    await store.send(.fetchData) { $0.loadingStatus = .loading }

    await store.receive(.dataFetched(.failure(RocketsClientAsyncError.modelConversionError))) {
      $0.loadingStatus = .failure(RocketsClientAsyncError.modelConversionError)
    }
  }
}
