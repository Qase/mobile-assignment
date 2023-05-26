#if DEBUG
import Dependencies
import Foundation

public extension RocketsClient {
   static let test = Self(
    getRocket: unimplemented("\(Self.self).getRocket"),
    getAllRockets: unimplemented("\(Self.self).getAllRockets")
  )
}
#endif
