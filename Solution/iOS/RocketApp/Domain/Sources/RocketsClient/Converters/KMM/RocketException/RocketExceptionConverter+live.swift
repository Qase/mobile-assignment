import Dependencies
import Foundation
import ModelConvertible
import fetchRockets

public extension RocketExceptionConverter {
  static var live = Self(
    domainModelConverter: { error in
      switch error {
      case is RocketResult<RocketException.HttpError>:
          return RocketsClientAsyncError.networkError(.serverError(statusCode: 404))
      case is RocketResult<RocketException.NetworkError>:
          return RocketsClientAsyncError.networkError(.noConnection)
      case is RocketResult<RocketException.UnknownError>:
          return RocketsClientAsyncError.undefinedError
      default:
          return RocketsClientAsyncError.networkError(.timeoutError)
      }
    }
  )
}
