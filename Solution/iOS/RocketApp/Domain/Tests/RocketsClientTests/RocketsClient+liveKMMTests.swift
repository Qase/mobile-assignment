import Combine
import Dependencies
@testable import Networking
@testable import RocketsClient
import XCTest

//TODO: Tests in KMM
final class RocketsClientLiveKMMTests: XCTestCase {
  
  func test_rocket_success() async {
    var rocketData: RocketDetail?

    // swiftlint:disable:next force_try

    await withDependencies {
      $0.lineMeasureConverterKMM = .live
      $0.weightScaleConverterKMM = .live
      $0.stageConverterKMM = .live
      $0.rocketConverterKMM = .live
    } operation: {
      do {
        rocketData = try await RocketsClient.liveKMM.getRocket("")
      } catch let error {
        XCTFail("Unexpected failure. \(error)")
      }

      XCTAssertEqual(rocketData?.id, "apollo13")
    }
  }

  func test_rocket_request_failure() async {
    
    await withDependencies { _ in
    } operation: {
      do {
        _ = try await RocketsClient.liveKMM.getRocket("")
      } catch let error {
        guard error is RocketsClientAsyncError else {
          XCTFail("Unexpected error type - \(error).")
          return
        }
      }
    }
  }

  func test_rockets_request_success() async {
    var rocketData: [RocketDetail] = []

    // swiftlint:disable:next force_try

    await withDependencies {
      $0.lineMeasureConverterKMM = .live
      $0.weightScaleConverterKMM = .live
      $0.stageConverterKMM = .live
      $0.rocketConverterKMM = .live
      $0.rocketsConverterKMM = .live
    } operation: {
      do {
        rocketData = try await RocketsClient.liveKMM.getAllRockets()
      } catch let error {
        XCTFail("Unexpected failure. \(error)")
      }

      XCTAssertEqual(rocketData[0].id, "apollo13")
    }
  }

  func test_rockets_request_failure() async {
    let exp = expectation(description: "")

    await withDependencies { _ in
    } operation: {
      do {
        _ = try await RocketsClient.liveKMM.getAllRockets()
      } catch let error {
        guard error is RocketsClientAsyncError else {
          XCTFail("Unexpected error type - \(error).")
          return
        }

        exp.fulfill()
      }

        await fulfillment(of: [exp], timeout: 0.1)
    }
  }
}
