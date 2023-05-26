#if DEBUG
import Dependencies
import Foundation
import Networking

public extension NetworkClient {
  static let test = Self(
    urlRequester: unimplemented("\(Self.self).urlRequester"),
    networkMonitorClient: unimplemented("\(Self.self).networkMonitorClient")
  )
}
#endif
