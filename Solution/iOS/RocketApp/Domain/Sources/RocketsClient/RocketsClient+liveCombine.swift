import Dependencies
import ErrorReporting
import Foundation
import NetworkClientExtensions
import Networking
import RequestBuilder

public extension RocketsClient {
  static var liveCombine: Self {
    @Dependency(\.networkClientType) var networkClientType
    @Dependency(\.rocketConverter) var rocketConverter
    @Dependency(\.rocketsConverter) var rocketsConverter

    return Self(
      getRocket: { id in
        try await Request(endpoint: URLs.baseURL + "/v3/rockets/\(id)")
          .execute(using: networkClientType)
          .mapErrorReporting(to: RocketsClientCombineError.networkError)
          .convertToDomainModel(using: rocketConverter)
          .eraseToAnyPublisher()
          .async()
      },
      getAllRockets: {
        try await Request(endpoint: URLs.baseURL + "/v3/rockets")
          .execute(using: networkClientType)
          .mapErrorReporting(to: RocketsClientCombineError.networkError)
          .convertToDomainModel(using: rocketsConverter)
          .eraseToAnyPublisher()
          .async()
      }
    )
  }
}
