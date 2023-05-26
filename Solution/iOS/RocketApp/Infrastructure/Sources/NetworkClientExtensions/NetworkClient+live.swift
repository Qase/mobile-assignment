import Foundation
import Networking

public extension NetworkClient {
  static let live = Self(
    urlRequester: .live(urlSessionConfiguration: .default),
    networkMonitorClient: .live(onQueue: .main)
  )
}
