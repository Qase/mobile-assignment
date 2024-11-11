import ComposableArchitecture
import Foundation
import Login
import RocketList

public struct AppCore: ReducerProtocol {
  public enum State: Equatable {
    case login(LoginCore.State)
    case rocketList(RocketListCore.State)
    
    public init() {
      self = .login(LoginCore.State())
    }
  }
  
  public enum Action {
    case login(LoginCore.Action)
    case rocketList(RocketListCore.Action)
  }

  public init() {}

  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case .login(.loginSucceeded):
        state = .rocketList(RocketListCore.State())
        return .none
      case .rocketList(.logoutTapped):
        state = .login(LoginCore.State())
        return .none
      default:
        return .none
      }
    }
    .ifCaseLet(/State.login, action: /Action.login) {
      LoginCore()
    }
    .ifCaseLet(/State.rocketList, action: /Action.rocketList) {
      RocketListCore()
    }
  }
}
