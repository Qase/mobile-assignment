#if DEBUG
import Dependencies
import ModelConvertible
import fetchRockets

public extension RocketExceptionConverter {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}
#endif
