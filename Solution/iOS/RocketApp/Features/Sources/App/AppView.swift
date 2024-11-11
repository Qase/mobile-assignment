import ComposableArchitecture
import Login
import RocketList
import SwiftUI

public struct AppView: View {
  let store: StoreOf<AppCore>

  public init(store: StoreOf<AppCore>) {
    self.store = store
  }

  public var body: some View {
    SwitchStore(store) {
      CaseLet(
        state: /AppCore.State.login,
        action: AppCore.Action.login,
        then: LoginView.init
      )
      CaseLet(
        state: /AppCore.State.rocketList,
        action: AppCore.Action.rocketList,
        then: RocketListView.init
      )
    }
  }
}

#Preview {
  AppView(
    store: Store(
      initialState: AppCore.State(),
      reducer: AppCore()
    )
  )
}
