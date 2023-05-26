import ComposableCoreMotion
import Dependencies
import Foundation

enum MotionClientKey: DependencyKey {
  public static var liveValue: MotionManager = .live
  #if DEBUG
  public static var testValue: MotionManager = .unimplemented()
  #endif
}

public extension DependencyValues {
  var motionClient: MotionManager {
    get { self[MotionClientKey.self] }
    set { self[MotionClientKey.self] = newValue }
  }
}
