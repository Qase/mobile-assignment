import ComposableArchitecture
import App
import SwiftUI

@main
struct RocketApp: App {
  var body: some Scene {
    WindowGroup {
      AppView(
        store: Store(
          initialState: AppCore.State(),
          reducer: AppCore()
        )
      )
    }
  }
}
