import ComposableArchitecture
//import RocketList
import Login
import SwiftUI

@main
struct RocketApp: App {
  var body: some Scene {
    WindowGroup {
//      RocketListView(
//        store: Store(
//          initialState: RocketListCore.State(),
//          reducer: RocketListCore()._printChanges()
//        )
//      )
      LoginView(
        store: Store(
          initialState: LoginCore.State(),
          reducer: LoginCore()
        )
      )
    }
  }
}
