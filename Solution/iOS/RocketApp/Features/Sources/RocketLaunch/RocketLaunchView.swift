import ComposableArchitecture
import RocketsClient
import SwiftUI
import UIToolkit

public struct RocketLaunchView: View {
  public let store: StoreOf<RocketLaunchCore>
  @ObservedObject var viewStore: ViewStore<ViewState, RocketLaunchCore.Action>

  @State var backgroundOpacity: Double = 0
  @State var blinkOpacity: Double = 0
  @State var rocketScale: Double = 1
  @State var pollutionScale: Double = 0.5

  struct ViewState: Equatable {
    let lWidth: Double
    let rWidth: Double
    let height: Double
    let rocketHasLaunched: Bool
    let isResetButton: Bool
    let counter: Int
    let paralaxOffset: CGRect
    let motionError: NSError?
    let platformOpacity: Double
    let text: LocalizedStringKey
    let textColor: Color

    init(state: RocketLaunchCore.State) {
      self.lWidth = state.lWidth
      self.rWidth = state.rWidth
      self.height = state.height
      self.rocketHasLaunched = state.rocketHasLaunched
      self.isResetButton = state.rocketHasLaunched && state.calculatedHeight < 0
      self.counter = Int(state.neededTiltToLaunch - state.calculatedHeight)
      self.paralaxOffset = CGRect(x: CGFloat(state.pitch * -80), y: CGFloat(state.roll * -80), width: 0, height: 0)
      self.motionError = state.motionError
      self.platformOpacity = state.rocketHasLaunched ? 0 : 1
      self.text = state.rocketHasLaunched ? .launchSuccessful : .tiltToLaunch(state.rocketData.name)
      self.textColor = state.rocketHasLaunched ? .indigo : .white
    }
  }

  public init(store: StoreOf<RocketLaunchCore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { ViewState(state: $0) })
  }

  public var body: some View {
    VStack(spacing: 0) {
      Spacer()

      HStack {
        Spacer()
          .frame(maxWidth: viewStore.lWidth)

        if viewStore.rocketHasLaunched {
          flyingRocket
        } else {
          Image.rocketIdle
        }

        Spacer()
          .frame(maxWidth: viewStore.rWidth)
      }

      Spacer()
        .frame(maxHeight: viewStore.height)

      if !viewStore.rocketHasLaunched {
        platform
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .ignoresSafeArea()
    .background {
      ZStack {
        space

        daySky
      }
    }
    .overlay {
      if viewStore.rocketHasLaunched {
        text
          .opacity(1 - backgroundOpacity)
          .animation(.easeOut(duration: 5), value: backgroundOpacity)
      }
    }
    .overlay(alignment: .bottom) {
      if viewStore.isResetButton {
        Button(.resetLaunch) { viewStore.send(.resetLaunch) }
          .buttonStyle(.borderedProminent)
          .cornerRadius(12)
      }
    }
    .overlay { flash }
    .overlay {
      if let error = viewStore.motionError {
        errorView(error)
      }
    }
    .onAppear { viewStore.send(.onAppear) }
  }

  private var flyingRocket: some View {
    Image.rocketFlying
      .scaleEffect(rocketScale)
      .overlay(alignment: .bottom) {
        Group {
          HStack {
            ForEach((1...3), id: \.self) { _ in
              Circle()
                .trim(from: 0, to: 0.6)
                .stroke()
            }
          }
          .frame(width: 100, height: 100)

          HStack {
            ForEach((1...2), id: \.self) { _ in
              Circle()
                .trim(from: 0, to: 0.6)
                .stroke()
            }
          }
          .frame(width: 80, height: 100)
        }
        .offset(y: 50)
        .foregroundColor(.gray)
        .scaleEffect(pollutionScale)
        .onAppear {
          withAnimation(
            Animation.easeInOut(duration: 0.08)
              .repeatForever(autoreverses: true)
          ) {
            rocketScale = 0.99
            pollutionScale = 1
          }
        }
        .onDisappear {
          rocketScale = 1
          pollutionScale = 0.5
        }
      }
  }

  @ViewBuilder
  private var platform: some View {
    ZStack(alignment: .top) {
      Rectangle()
        .fill(.indigo)
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .frame(height: 100)

      HStack {
        Spacer()

        text
          .multilineTextAlignment(.center)

        Spacer()

        launchCounter
      }
      .padding([.top, .trailing, .leading])
    }
  }

  private var launchCounter: some View {
    ZStack {
      Rectangle()
        .fill(AngularGradient(gradient: Gradient(colors: [.black, .gray]), center: .bottom))
        .frame(width: 40, height: 40)
        .cornerRadius(12)

      Rectangle()
        .fill(.white)
        .frame(width: 28, height: 28)
        .cornerRadius(4)

      Text("\(viewStore.counter)")
        .foregroundColor(.black)
    }
  }

  private var space: some View {
    Image.space
      .ignoresSafeArea()
      .opacity(backgroundOpacity)
      .offset(x: viewStore.paralaxOffset.midX, y: viewStore.paralaxOffset.midY)
      .onChange(of: viewStore.rocketHasLaunched) { hasLaunched in
        withAnimation(.easeInOut(duration: 15)) {
          if hasLaunched {
            backgroundOpacity = 1
          }
        }

        if !hasLaunched {
          backgroundOpacity = 0
        }
      }
  }

  private var daySky: some View {
    LinearGradient(
      gradient: Gradient(stops: [.init(color: .blue.opacity(0.5), location: 0), .init(color: .white, location: 0.7)]),
      startPoint: .top,
      endPoint: .bottom
    )
    .opacity(1 - backgroundOpacity)
  }

  private var text: some View {
    Text(viewStore.text)
      .font(.headline)
      .bold()
      .foregroundColor(viewStore.textColor)
  }

  private var flash: some View {
    Color.yellow
      .ignoresSafeArea()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .opacity(blinkOpacity)
      .onChange(of: viewStore.rocketHasLaunched) { _ in
        blinkOpacity = 1
        withAnimation(Animation.spring().delay(0.05)) { blinkOpacity = 0 }
      }
  }

  private func errorView(_ error: NSError) -> some View {
    withAnimation {
      VStack {
        Image.spaceError.opacity(0.5)

        Text("\(error)")
      }
    }
  }
}

struct RocketLaunch_Previews: PreviewProvider {
  static var previews: some View {
    RocketLaunchView(
      store: .init(
        initialState: RocketLaunchCore.State(rocketData: RocketDetail.mock, rocketHasLaunched: false),
        reducer: RocketLaunchCore()
      )
    )
  }
}
