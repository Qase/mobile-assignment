import ComposableArchitecture
import CoreToolkit
import Foundation
import NetworkClientExtensions
import RocketDetail
import RocketListCell
import RocketsClient

public struct RocketListCore: ReducerProtocol {
  public struct State: Equatable {
    var loadingStatus: Loadable<IdentifiedArrayOf<RocketListCellCore.State>, RocketsClientAsyncError> = .notRequested
    @PresentationState var rocketDetail: RocketDetailCore.State?
   
    public init() {}
  }

  public enum Action: Equatable {
    case rocketListCell(id: RocketListCellCore.State.RocketID, action: RocketListCellCore.Action)
    case fetchData
    case dataFetched(TaskResult<[RocketDetail]>)
    case rocketDetail(PresentationAction<RocketDetailCore.Action>)
  }

  public init() {}

  @Dependency(\.rocketsClient) var rocketsClient
  @Dependency(\.mainQueue) var mainQueue

  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case .rocketListCell(id: let id, action: .cellTapped):
        guard let rocketData = state.loadingStatus.data?[id: id] else {
          return .none
        }

        state.rocketDetail = .init(rocketData: rocketData.rocketData)
        return .none

      case .fetchData:
        state.loadingStatus = .loading

        return .task {
          await .dataFetched(TaskResult { try await rocketsClient.getAllRockets() })
        }

      case let .dataFetched(.success(rocketsData)):
          state.loadingStatus = .success(
            IdentifiedArrayOf(
              uniqueElements: rocketsData.map {
                RocketListCellCore.State(rocketData: $0)
              }
            )
          )
          return .none

      case let .dataFetched(.failure(error)):
        state.loadingStatus = .failure(RocketsClientAsyncError(from: error))
        return .none
     
      case .rocketDetail:
        return .none
      }
    }
    .forEach(\.loadingStatus.arrayData, action: /Action.rocketListCell) { RocketListCellCore() }
    .ifLet(\.$rocketDetail, action: /Action.rocketDetail) { RocketDetailCore() }
  }
}

// TODO: Make it generic and move to Loadable.
extension Loadable<IdentifiedArrayOf<RocketListCellCore.State>, RocketsClientAsyncError> {
  var arrayData: IdentifiedArrayOf<RocketListCellCore.State> {
    get {
      switch self {
      case let .success(data):
        return data
      default:
        return []
      }
    }

    set {
      self = .success(newValue)
    }
  }
}
