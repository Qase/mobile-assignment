import CoreToolkit
import Dependencies
import ErrorReporting
import Foundation
import NetworkClientExtensions
import Networking
import RequestBuilder
import fetchRockets
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
        do {
          let rocket = try await asyncFunction(for: rocketApi.fetchRocketById(rocketId: id))
          //MARK: Even though warning is saying "always fails" it in fact does not fail at all. Swift is confused about KMM. - Ignore this warrning
          switch rocket {
          case let success as RocketResultSuccess<AnyObject>:
            guard let result = rocketConverterKMM.domainModel(fromExternal: success.data as! RocketKMM) else {
              throw RocketsClientAsyncError.modelConversionError
            }
            
            return result
            
          case let failure as RocketResult<RocketException>:
            throw errorFromRocketFailure(failure)
            
          default:
            throw RocketsClientAsyncError.undefinedError
          }
        } catch {
          throw error
        }
      },
      getAllRockets: {
        do {
          let rockets = try await asyncFunction(for: rocketApi.fetchAllRockets())
          //MARK: Even though warning is saying "always fails" it in fact does not fail at all. Swift is confused about KMM. - Ignore this warrning
          switch rockets {
          case let success as RocketResultSuccess<AnyObject>:
            guard let result = rocketsConverterKMM.domainModel(fromExternal: success.data as! [RocketKMM]) else {
              throw RocketsClientAsyncError.modelConversionError
            }
            
            return result
            
          case let failure as RocketResult<RocketException>:
            throw errorFromRocketFailure(failure)
            
          default:
            throw RocketsClientAsyncError.undefinedError
          }

        } catch {
          throw error
        }
      }
    )
  }
}
