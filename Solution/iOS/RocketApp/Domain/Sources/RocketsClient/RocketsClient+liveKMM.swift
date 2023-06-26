import CoreToolkit
import Dependencies
import ErrorReporting
import Foundation
import NetworkClientExtensions
import Networking
import RequestBuilder
import KMMmodule
import KMPNativeCoroutinesCore
import KMPNativeCoroutinesAsync

public extension RocketsClient {
  static var liveKMM: Self {
    @Dependency(\.rocketConverterKMM) var rocketConverterKMM
    @Dependency(\.rocketsConverterKMM) var rocketsConverterKMM
    
    //MARK: KMM Rocket library integration
    let rocketApi = RocketApi()
    
    return Self(
      getRocket: { id in
        let rocket = try await asyncFunction(for: rocketApi.fetchRocketById(rocketId: id))
        guard let result = rocketConverterKMM.domainModel(fromExternal: rocket) else {
          throw RocketsClientAsyncError.modelConversionError
        }
        
        return result
      },
      getAllRockets: {
        //MARK: asyncResult
        let rockets = await asyncResult(for: rocketApi.fetchAllRockets())
        switch rockets {
        case let .success(rockets):
          print(rockets)
          guard let result = rocketsConverterKMM.domainModel(fromExternal: rockets as! [RocketKMM]) else {
            throw RocketsClientAsyncError.modelConversionError
          }
          return result

        case .failure:
          throw RocketsClientAsyncError.undefinedError
        }
        
        //MARK: asyncFunction
//        do {
//          let rockets = try await asyncFunction(for: rocketApi.fetchAllRockets())
//          guard let result = rocketsConverterKMM.domainModel(fromExternal: rockets as! [RocketKMM]) else {
//            throw RocketsClientAsyncError.modelConversionError
//          }
//
//          return result
//        } catch {
//          print(error)
//          if error is RocketException {
//            throw RocketsClientAsyncError.undefinedError
//          } else if error is KotlinException {
//            throw RocketsClientAsyncError.modelConversionError
//          }
//          throw RocketsClientAsyncError.networkError(.invalidResponse)
//        }
      }
    )
  }
}
