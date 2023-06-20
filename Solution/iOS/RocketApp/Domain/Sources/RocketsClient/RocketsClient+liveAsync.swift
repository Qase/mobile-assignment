import CoreToolkit
import Dependencies
import ErrorReporting
import Foundation
import NetworkClientExtensions
import Networking
import RequestBuilder

public extension RocketsClient {
  static var liveAsync: Self {
    @Dependency(\.networkClientType) var networkClientType
    @Dependency(\.rocketConverter) var rocketConverter
    @Dependency(\.rocketsConverter) var rocketsConverter

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

        guard let result = rocketsConverter.domainModel(fromExternal: data) else {
          throw RocketsClientAsyncError.modelConversionError
        }

        return result
      }
    )
  }
}
