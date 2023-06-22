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
        do {
          let rockets = try await rocketApi.fetchAllRockets()
          guard let result = rocketsConverterKMM.domainModel(fromExternal: rockets) else {
            throw RocketsClientAsyncError.modelConversionError
          }
          return result

        } catch let error as KotlinException {
          if let rocketError = error.cause as? RocketException {
            switch rocketError {
            case _ as RocketException.NetworkError:
              throw RocketsClientAsyncError.networkError(.noConnection)
            default:
              print("🥶🥶🥶🥶🥶 \(error) 🥶🥶🥶🥶🥶")
              throw RocketsClientAsyncError.undefinedError
            }
          } else {
            throw RocketsClientAsyncError.networkError(.unauthorized)
          }
        } catch let error {
          print("🥶🥶🥶🥶🥶 \(error) 🥶🥶🥶🥶🥶")
          throw RocketsClientAsyncError.networkError(.invalidResponse)
        }
//        rocketApi.fetchRockets { rockets in
//          guard let result = rocketsConverterKMM.domainModel(fromExternal: rockets) else {
//            throw RocketsClientAsyncError.modelConversionError
//          }
//
//          return result
//        } failure: { error in
//          switch error {
//          case _ as RocketException.HttpError:
//            throw RocketsClientAsyncError.networkError(.noConnection)
//          default:
//            throw RocketsClientAsyncError.undefinedError
//          }
//        }

//        let rockets = try await rocketApi.fetchAllRockets()
//
//        guard let result = rocketsConverterKMM.domainModel(fromExternal: rockets) else {
//          throw RocketsClientAsyncError.modelConversionError
//        }
//        return result
      }
    )
  }
}
