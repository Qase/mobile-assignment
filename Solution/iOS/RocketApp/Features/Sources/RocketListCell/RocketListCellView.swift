import ComposableArchitecture
import RocketsClient
import SwiftUI
import UIToolkit

public struct RocketListCellView: View {
  let store: StoreOf<RocketListCellCore>

  public init(store: StoreOf<RocketListCellCore>) {
    self.store = store
  }

  public var body: some View {
    WithViewStore(self.store) { viewStore in
      Button {
        viewStore.send(.cellTapped)
      } label: {
        HStack {
          Image.rocket
            .resizable()
            .frame(width: 36, height: 36)

          VStack(alignment: .leading, spacing: 4) {
            Text(viewStore.rocketData.name)
              .font(.title2.bold())

            Text("First flight: \(viewStore.rocketData.firstFlight)")
              .font(.callout)
              .foregroundColor(.gray)
          }

          Spacer()

          Image.linkArrow
            .resizable()
            .frame(width: 32, height: 32)
        }
      }
    }
  }
}

struct RocketListCell_Previews: PreviewProvider {
  static var previews: some View {
    RocketListCellView(
      store: .init(
        initialState: RocketListCellCore.State(rocketData: RocketDetail.mock),
        reducer: RocketListCellCore()
      )
    )
  }
}
