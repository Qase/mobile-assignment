import CoreToolkit
import Dependencies
import ErrorReporting
import Foundation
import NetworkClientExtensions
import Networking
import RequestBuilder
import KMMmodule

public extension RocketsClient {
  static var liveAsync: Self {
    @Dependency(\.networkClientType) var networkClientType
    @Dependency(\.rocketConverter) var rocketConverter
    @Dependency(\.rocketsConverter) var rocketsConverter
    @Dependency(\.rocketConverter2) var rocketConverter2
    @Dependency(\.rocketsConverter2) var rocketsConverter2
    
    return Self(
      getRocket: { id in
        let data: RocketDetailDTO = try await doAsync(mapError: RocketsClientAsyncError.mapNetworkError) {
          try await Request(endpoint: URLs.baseURL + "/v3/rockets/\(id)")
            .execute(using: networkClientType)
        }

        guard let result = rocketConverter.domainModel(fromExternal: data) else {
          throw RocketsClientAsyncError.modelConversionError
        }

        return result
      },
      getAllRockets: {
        let data: [RocketDetailDTO] = try await doAsync(mapError: RocketsClientAsyncError.mapNetworkError) {
          try await Request(endpoint: URLs.baseURL + "/v3/rockets/")
            .execute(using: networkClientType)
        }
        print(Greeting().greet())
        let rocketApi = RocketApi()
        
        DispatchQueue.main.async {
            Task {
                do {
                  let rockets = try await rocketApi.fetchRockets()
//                    print(rockets)
                  
                  guard let result = rocketsConverter2.domainModel(fromExternal: rockets) else {
                    throw RocketsClientAsyncError.modelConversionError
                  }
                  
                  print(result)
                } catch {
                    print("Error fetching rockets: \(error)")
                }
            }
        }

        guard let result = rocketsConverter.domainModel(fromExternal: data) else {
          throw RocketsClientAsyncError.modelConversionError
        }

        return result
      }
    )
  }
}
