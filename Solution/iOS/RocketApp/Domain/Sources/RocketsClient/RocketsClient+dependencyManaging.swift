import Dependencies
import Foundation

enum RocketsClientKey: DependencyKey {
  
  public static let liveValue: RocketsClient = .liveKMM
  #if DEBUG
  public static let testValue: RocketsClient = .test
  #endif
  public static let previewValue: RocketsClient = .preview
}

public extension DependencyValues {
  var rocketsClient: RocketsClient {
    get { self[RocketsClientKey.self] }
    set { self[RocketsClientKey.self] = newValue }
  }
}

