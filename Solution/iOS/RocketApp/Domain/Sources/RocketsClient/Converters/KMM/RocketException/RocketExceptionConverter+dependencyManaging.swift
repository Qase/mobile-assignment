import Dependencies
import Foundation
import ModelConvertible

enum RocketExceptionConverterKey: DependencyKey {
  static let liveValue: RocketExceptionConverter = .live
  #if DEBUG
  static let testValue: RocketExceptionConverter = .test
  #endif
}

public extension DependencyValues {
  var rocketExceptionConverter: RocketExceptionConverter {
    get { self[RocketExceptionConverterKey.self] }
    set { self[RocketExceptionConverterKey.self] = newValue }
  }
}
