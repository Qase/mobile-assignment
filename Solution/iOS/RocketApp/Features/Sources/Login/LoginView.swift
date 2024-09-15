import ComposableArchitecture
import SwiftUI

public struct LoginView: View {
  let store: StoreOf<LoginCore>

  public init(store: StoreOf<LoginCore>) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store) { viewStore in
      VStack {
        Text("Shiiiiiiiiiit, your credentials are not valid")
          .foregroundStyle(.white)
          .frame(maxWidth: .infinity)
          .padding()
          .background(Color.pink)
          .transition(.opacity)
          .opacity(viewStore.isAuthFailedMessageDisplayed ? 1 : 0)
          .accessibilityHidden(!viewStore.isAuthFailedMessageDisplayed)
          .animation(.interpolatingSpring, value: viewStore.isAuthFailedMessageDisplayed)

        content
      }
    }
  }

  var content: some View {
    WithViewStore(self.store) { viewStore in
      VStack {
        Text("Login")
          .font(.largeTitle)
          .fontWeight(.bold)
          .padding(.top, 20)

        Spacer()

        TextField("Username", text: viewStore.binding(\.$username))
          .textFieldStyle(.roundedBorder)

        SecureField("Password", text: viewStore.binding(\.$password))
          .textFieldStyle(.roundedBorder)

        Spacer()

        Button("Login") {
          viewStore.send(.loginTapped)
        }
        .buttonStyle(.borderedProminent)
        .tint(.pink)
      }
      .padding(.horizontal, 20)
    }
  }
}

//#Preview {
//    LoginView()
//}
