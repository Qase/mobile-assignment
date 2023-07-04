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
    @Dependency(\.rocketKMMConverter) var rocketKMMConverter
    @Dependency(\.rocketsKMMConverter) var rocketsKMMConverter
    @Dependency(\.rocketExceptionConverter) var rocketExceptionConverter
    
    //MARK: KMM Rocket library integration
    let rocketApi = RocketApi()
    
    return Self(
      getRocket: { id in
        do {
          let rocket = try await asyncFunction(for: rocketApi.fetchRocketById(rocketId: id))
          //MARK: Even though warning is saying "always fails" it in fact does not fail at all. Swift is confused about KMM. - Ignore this warrning
          switch rocket {
          case let success as RocketResultSuccess<AnyObject>:
            guard let result = rocketKMMConverter.domainModel(fromExternal: success.data as! RocketKMM) else {
              throw RocketsClientAsyncError.modelConversionError
            }
            
            return result
            
          case let failure as RocketResult<RocketException>:
            guard let error = rocketExceptionConverter.domainModel(fromExternal: failure) else {
              throw RocketsClientAsyncError.modelConversionError
            }
            
            throw error
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
            guard let result = rocketsKMMConverter.domainModel(fromExternal: success.data as! [RocketKMM]) else {
              throw RocketsClientAsyncError.modelConversionError
            }
            
            return result
            
          case let failure as RocketResult<RocketException>:
            guard let error = rocketExceptionConverter.domainModel(fromExternal: failure) else {
              throw RocketsClientAsyncError.modelConversionError
            }
            
            throw error
            
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
