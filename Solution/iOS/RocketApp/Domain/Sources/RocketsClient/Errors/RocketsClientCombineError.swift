import ErrorReporting
import Foundation
import Networking

public struct RocketsClientCombineError: CombineErrorReporting {
  public var stackID: UUID

  public let cause: Cause
  public var causeDescription: String { cause.description }

  public var underlyingError: CombineErrorReporting?

  public enum Cause: Error, CustomStringConvertible, Equatable {
    case networkError
    case modelConversionError

    public var description: String {
      switch self {
      case .networkError:
        return "network error"
      case .modelConversionError:
        return "model conversion error"
      }
    }
  }

  private init(stackID: UUID = UUID(), cause: Cause, underlyingError: CombineErrorReporting? = nil) {
    self.stackID = stackID
    self.cause = cause
    self.underlyingError = underlyingError
  }
}

// MARK: - Equatable conformance

extension RocketsClientCombineError: Equatable {
  public static func == (lhs: RocketsClientCombineError, rhs: RocketsClientCombineError) -> Bool {
    lhs.isEqual(to: rhs)
  }
}

// MARK: - Conformance instances

extension RocketsClientCombineError: NetworkErrorCapable, ModelConvertibleErrorCapable, URLRequestBuilderErrorCapable {
  public static var networkError: RocketsClientCombineError { .init(cause: .networkError) }
  public static var modelConvertibleError: RocketsClientCombineError { .init(cause: .modelConversionError) }
  public static var urlRequestBuilderError: RocketsClientCombineError { .init(cause: .networkError) }
}
