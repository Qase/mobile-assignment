import Combine
import Dependencies
@testable import Networking
@testable import RocketsClient
import fetchRockets
import KMPNativeCoroutinesAsync
import KMPNativeCoroutinesCore
import XCTest

//TODO: Tests in KMM
final class RocketsClientLiveKMMTests: XCTestCase {
  
  func test_rocket_success() async {
    var rocketData: RocketDetail?

    // swiftlint:disable:next force_try

    withDependencies {
      $0.lineMeasureKMMConverter = .live
      $0.weightScaleKMMConverter = .live
      $0.stageKMMConverter = .live
      $0.rocketKMMConverter = .live
      $0.rocketExceptionConverter = .live
    } operation: {
      @Dependency(\.rocketKMMConverter) var rocketKMMConverter
      
      rocketData = rocketKMMConverter.domainModel(fromExternal: RocketKMM.mock)
      XCTAssertEqual(rocketData?.id, "apollo13")
    }
  }

  func test_rocket_request_failure() async {
    
    await withDependencies {
      $0.rocketExceptionConverter = .live
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
  
  func test_rocket_request_failure_network() async {
    var count = 0
    // swiftlint:disable:next force_try

    await withDependencies {
      $0.lineMeasureKMMConverter = .live
      $0.weightScaleKMMConverter = .live
      $0.stageKMMConverter = .live
      $0.rocketKMMConverter = .live
      $0.rocketExceptionConverter = .live
    } operation: {
      do {
        let _: RocketDetail? = try await RocketsClient.liveKMM.getRocket("")
      } catch let error {
        XCTAssertEqual(error as! RocketsClientAsyncError, RocketsClientAsyncError.networkError(.serverError(statusCode: 404)))
        count += 1
      }

      XCTAssertEqual(count, 1)
    }
  }
}
