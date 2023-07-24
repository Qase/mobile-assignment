import ComposableArchitecture
import ComposableCoreMotion
import Foundation
import MotionClient
import RocketsClient

public struct RocketLaunchCore: ReducerProtocol {
  public struct State: Equatable {
    public var rocketData: RocketDetail

    var rocketHasLaunched: Bool = false
    var potentialHeight: Double?
    var initialHeight: Double { potentialHeight ?? 0 }

    var neededTiltToLaunch: Double = 100
    var rWidth: Double = 0
    var lWidth: Double = 0
    var height: Double = 0

    var calculatedHeight: Double = 0

    var roll: Double = 0
    var pitch: Double = 0

    var motionError: NSError?

    public init(rocketData: RocketDetail, rocketHasLaunched: Bool = false) {
      self.rocketData = rocketData
      self.rocketHasLaunched = rocketHasLaunched
    }
  }

  public enum Action: Equatable {
    case onAppear
    case updateMotionData(Result<DeviceMotion, NSError>)
    case resetLaunch
    case onDisappear
  }

  public init() {}

  @Dependency(\.motionClient) var motionManager

  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      struct MotionManagerID: Hashable {}

      switch action {
      case .onAppear:
        return .concatenate(
          motionManager
            .create(id: MotionManagerID())
            .fireAndForget(),

          motionManager
            .startDeviceMotionUpdates(id: MotionManagerID(), using: .xArbitraryZVertical, to: .main)
            .mapError { $0 as NSError }
            .catchToEffect(RocketLaunchCore.Action.updateMotionData)
        )

      case let .updateMotionData(.success(motionData)):
        if state.potentialHeight == nil {
          state.potentialHeight = motionData.attitude.quaternion.x
        }

        let totalRocketMass = state.rocketData.mass.kilograms / 1000 + state.rocketData.firstStage.fuelMass
        let magnitude: Double = Double(8 * pow(10, 6) / (totalRocketMass + 5000))
        let actualTilt = motionData.attitude.quaternion.x
        let isUnnaturalTilt: Bool = state.initialHeight < 0 && state.initialHeight * magnitude > -400
        let gravityKeeper = (state.initialHeight > 0 && actualTilt < 0 ? abs(actualTilt) * magnitude : 0)

        let width = motionData.attitude.quaternion.y * magnitude

        state.calculatedHeight = isUnnaturalTilt
          ? (state.initialHeight + abs(actualTilt)) * magnitude
          : (abs(state.initialHeight) - abs(actualTilt)) * magnitude + gravityKeeper

        state.rWidth = width < 0 && state.rocketHasLaunched ? abs(width) : 0
        state.lWidth = width > 0 && state.rocketHasLaunched ? width : 0
        state.height = state.calculatedHeight > state.neededTiltToLaunch || state.rocketHasLaunched
          ? max(state.calculatedHeight, 0)
          : 0
        state.rocketHasLaunched = state.rocketHasLaunched ? true : state.height != 0

        state.pitch = motionData.attitude.pitch
        state.roll = motionData.attitude.roll

        return .none

      case let .updateMotionData(.failure(motionError)):
        state.motionError = motionError
        return .none

      case .resetLaunch:
        state.rocketHasLaunched = false
        return .none

      case .onDisappear:
        return .concatenate(
          motionManager
            .stopDeviceMotionUpdates(id: MotionManagerID())
            .fireAndForget(),

          motionManager
            .destroy(id: MotionManagerID())
            .fireAndForget()
        )
      }
    }
  }
}
