import ComposableArchitecture
import Foundation

public struct LoginCore: ReducerProtocol {
  public struct State: Equatable {
    @BindingState public var username: String
    @BindingState public var password: String
    public var isAuthFailedMessageDisplayed: Bool
    
    public init(username: String = "", password: String = "", isAuthFailedMessageDisplayed: Bool = false) {
      self.username = username
      self.password = password
      self.isAuthFailedMessageDisplayed = isAuthFailedMessageDisplayed
    }
  }

  public enum Action: BindableAction {
    case binding(BindingAction<State>)
    case loginTapped
    case loginSucceeded
  }

  public init() {}

  public var body: some ReducerProtocol<State, Action> {
    BindingReducer()
    
    Reduce { state, action in
      switch action {
      case .loginTapped:
        guard isValid(username: state.username, password: state.password) else {
          state.isAuthFailedMessageDisplayed = true
          return .none
        }
        
        return EffectTask(value: .loginSucceeded)
      case .binding:
        state.isAuthFailedMessageDisplayed = false
        return .none
      case .loginSucceeded:
        return .none
      }
    }
  }
}

func isValid(username: String, password: String) -> Bool {
  let validPairs: [String: String] = [
    "username1": "test1234",
    "astronaut1": "space"
  ]
  
  return validPairs[username] == password
}
