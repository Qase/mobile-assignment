import CoreToolkit
import ErrorReporting
import Foundation
import Networking

public enum RocketsClientAsyncError: ErrorReporting {
  public var debugDescription: String { description }

  case networkError(NetworkError)
  case modelConversionError
  case undefinedError

  public var description: String {
    switch self {
    case let .networkError(error):
      return "network error \(error.cause.description)"
    case .modelConversionError:
      return "model conversion error"
    case .undefinedError:
      return "undefinedError"
    }
  }

  public init(from error: Error) {
    guard let rocketError = error as? RocketsClientAsyncError else {
      self = .undefinedError
      return
    }

    self = rocketError
  }
}

// MARK: - AsyncErrorReportable conformance
extension RocketsClientAsyncError: UserErrorReportable {
  public var userDescription: String {
    switch self {
    case .networkError:
      return "Cannot load data :("
    case .modelConversionError:
      return "Cannot convert loaded data :("
    case .undefinedError:
      return "Undefined error"
    }
  }
}

// MARK: - AsyncErrorMapable conformance
extension RocketsClientAsyncError: AsyncNetworkErrorMapable {
  public static func mapNetworkError(error: Error) -> Self {
    guard let networkError = error as? NetworkError else {
      return RocketsClientAsyncError.undefinedError
    }

    return Self.networkError(networkError)
  }
}
