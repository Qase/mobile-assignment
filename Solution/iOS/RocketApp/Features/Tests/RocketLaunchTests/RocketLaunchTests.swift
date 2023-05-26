import Combine
import ComposableArchitecture
import ComposableCoreMotion
@testable import RocketLaunch
import RocketsClient
import XCTest

final class RocketLaunchTests: XCTestCase {
  let store = TestStore(
    initialState: RocketLaunchCore.State(rocketData: .mock),
    reducer: RocketLaunchCore()
  )

  // swiftlint:disable:next function_body_length
  func test_flow_updateMotionData_success() {
    let motionSubject = PassthroughSubject<DeviceMotion, Error>()
    var motionManagerIsLive = false
    let exp = expectation(description: "")

    store.dependencies.motionClient = .unimplemented(
      create: { _ in .fireAndForget { motionManagerIsLive = true } },
      destroy: { _ in .fireAndForget { motionManagerIsLive = false } },
      startDeviceMotionUpdates: { _, _, _ in motionSubject.eraseToEffect() },
      stopDeviceMotionUpdates: { _ in
        .fireAndForget { motionSubject.send(completion: .finished) }
      }
    )

    store.send(.onAppear)
    XCTAssertTrue(motionManagerIsLive)

    var deviceMotion = DeviceMotion(
      attitude: .init(quaternion: .init(x: 50, y: 0, z: 0, w: 0)),
      gravity: CMAcceleration(x: 0, y: 0, z: 0),
      heading: 0,
      magneticField: .init(field: .init(x: 0, y: 0, z: 0), accuracy: .high),
      rotationRate: .init(x: 0, y: 0, z: 0),
      timestamp: 0,
      userAcceleration: CMAcceleration(x: 0, y: 0, z: 0)
    )
    motionSubject.send(deviceMotion)

    store.receive(.updateMotionData(.success(deviceMotion))) {
      $0.potentialHeight = 50
      $0.rocketHasLaunched = false
      $0.roll = Double.pi
    }

    deviceMotion = DeviceMotion(
      attitude: .init(quaternion: .init(x: -100, y: 0, z: 0, w: 0)),
      gravity: CMAcceleration(x: 0, y: 0, z: 0),
      heading: 0,
      magneticField: .init(field: .init(x: 100, y: 0, z: 0), accuracy: .high),
      rotationRate: .init(x: 0, y: 0, z: 0),
      timestamp: 0,
      userAcceleration: CMAcceleration(x: 0, y: 0, z: 0)
    )
    motionSubject.send(deviceMotion)

    store.receive(.updateMotionData(.success(deviceMotion))) {
      let actualTilt = deviceMotion.attitude.quaternion.x
      let totalRocketMass = $0.rocketData.mass.kilograms / 1000 + $0.rocketData.firstStage.fuelMass
      let magnitude: Double = Double(8 * pow(10, 6) / (totalRocketMass + 5000))
      let gravityKeeper = abs(actualTilt) * magnitude

      $0.calculatedHeight = (abs($0.initialHeight) - abs(actualTilt)) * magnitude + gravityKeeper
      $0.height = $0.calculatedHeight
      $0.rocketHasLaunched = true
    }

    store.send(.resetLaunch) {
      $0.rocketHasLaunched = false
    }

    store.send(.onDisappear)
    XCTAssertFalse(motionManagerIsLive)

    _ = motionSubject
      .sink(
        receiveCompletion: {
          switch $0 {
          case let .failure(error):
            XCTFail("Unexpected event - failure: \(error).")
          case .finished:
            exp.fulfill()
          }
        },
        receiveValue: { _ in }
      )

    wait(for: [exp], timeout: 1)
  }

  func test_flow_updateMotionData_failure() {
    let motionSubject = PassthroughSubject<DeviceMotion, Error>()
    var motionManagerIsLive = false
    let exp = expectation(description: "")

    store.dependencies.motionClient = .unimplemented(
      create: { _ in .fireAndForget { motionManagerIsLive = true } },
      destroy: { _ in .fireAndForget { motionManagerIsLive = false } },
      startDeviceMotionUpdates: { _, _, _ in motionSubject.eraseToEffect() },
      stopDeviceMotionUpdates: { _ in .fireAndForget {} }
    )

    store.send(.onAppear)
    XCTAssertTrue(motionManagerIsLive)

    let nsError = NSError(domain: "", code: 0x1808f827c)
    motionSubject.send(completion: .failure(nsError))

    store.receive(.updateMotionData(.failure(nsError))) {
      $0.motionError = nsError
    }

    _ = motionSubject
      .sink(
        receiveCompletion: {
          switch $0 {
          case .failure:
            exp.fulfill()
          case .finished:
            XCTFail("Unexpected event - finished.")
          }

        },
        receiveValue: { _ in }
      )

    wait(for: [exp], timeout: 1)

    store.send(.onDisappear)
    XCTAssertFalse(motionManagerIsLive)
  }
}
