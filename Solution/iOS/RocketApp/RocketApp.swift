import ComposableArchitecture
import RocketList
import SwiftUI

@main
struct RocketApp: App {
  var body: some Scene {
    WindowGroup {
      RocketListView(
        store: Store(
          initialState: RocketListCore.State(),
          reducer: RocketListCore()._printChanges()
        )
      )
    }
  }
}
