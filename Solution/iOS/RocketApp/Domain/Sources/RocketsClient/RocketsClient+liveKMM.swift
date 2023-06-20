import CoreToolkit
import Dependencies
import ErrorReporting
import Foundation
import NetworkClientExtensions
import Networking
import RequestBuilder
import KMMmodule

@MainActor
public extension RocketsClient {
  static var liveKMM: Self {
    @Dependency(\.rocketConverterKMM) var rocketConverterKMM
    @Dependency(\.rocketsConverterKMM) var rocketsConverterKMM
    
    //MARK: KMM Rocket library integration
    let rocketApi = RocketApi()
    
    return Self(
      getRocket: { id in
        let rocket = try await rocketApi.fetchRocketById(rocketId: id)
        guard let result = rocketConverterKMM.domainModel(fromExternal: rocket) else {
          throw RocketsClientAsyncError.modelConversionError
        }
        
        return result
      },
      getAllRockets: {
        let rockets = try await rocketApi.fetchAllRockets()
        guard let result = rocketsConverterKMM.domainModel(fromExternal: rockets) else {
          throw RocketsClientAsyncError.modelConversionError
        }
        return result
      }
    )
  }
}
