import Foundation

public protocol AsyncNetworkErrorMapable: Error {
  static func mapNetworkError(error: Error) -> Self
}

public protocol UserErrorReportable: CustomStringConvertible {
  var userDescription: String { get }
}
