import ComposableArchitecture
import Foundation
import RocketLaunch
import RocketsClient

public struct RocketDetailCore: ReducerProtocol {
  public struct State: Equatable {
    public var rocketData: RocketDetail
    @PresentationState var rocketLaunch: RocketLaunchCore.State?
    var isUSMetrics = false

    public init(rocketData: RocketDetail) {
      self.rocketData = rocketData
    }
  }

  public enum Action: Equatable {
    case rocketLaunchTapped
    case setToUSMetrics
    case rocketLaunch(PresentationAction<RocketLaunchCore.Action>)
    case rocketLaunchDismiss
  }

  public init() {}

  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case .rocketLaunchTapped:
        state.rocketLaunch = .init(rocketData: state.rocketData)
        return .none

      case .setToUSMetrics:
        state.isUSMetrics.toggle()
        return .none
      
      case .rocketLaunch:
        return .none
        
      case .rocketLaunchDismiss:
        if state.rocketLaunch != nil {
          return .send(.rocketLaunch(.presented(.onDisappear)))
        }
        
        return .none
      }
    }
    .ifLet(\.$rocketLaunch, action: /Action.rocketLaunch) { RocketLaunchCore() }
  }
}
