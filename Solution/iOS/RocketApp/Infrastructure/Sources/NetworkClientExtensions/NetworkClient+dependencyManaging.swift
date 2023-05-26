import Dependencies
import Foundation
import Networking

enum NetworkClientKey: DependencyKey {
  public static let liveValue: NetworkClientType = NetworkClient.live
  public static let testValue: NetworkClientType = NetworkClient.test
}

public extension DependencyValues {
  var networkClientType: NetworkClientType {
    get { self[NetworkClientKey.self] }
    set { self[NetworkClientKey.self] = newValue }
  }
}
