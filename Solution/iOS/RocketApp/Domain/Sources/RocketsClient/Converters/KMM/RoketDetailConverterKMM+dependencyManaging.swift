import Dependencies
import Foundation
import ModelConvertible

enum RocketConverterKMMKey: DependencyKey {
  static let liveValue: RocketDetailConverterKMM = .live
  #if DEBUG
  static let testValue: RocketDetailConverterKMM = .test
  #endif
}

public extension DependencyValues {
  var rocketConverterKMM: RocketDetailConverterKMM {
    get { self[RocketConverterKMMKey.self] }
    set { self[RocketConverterKMMKey.self] = newValue }
  }
}

enum RocketsConverterKMMKey: DependencyKey {
  static let liveValue: RocketsDetailConverterKMM = .live
  #if DEBUG
  static let testValue: RocketsDetailConverterKMM = .test
  #endif
}

public extension DependencyValues {
  var rocketsConverterKMM: RocketsDetailConverterKMM {
    get { self[RocketsConverterKMMKey.self] }
    set { self[RocketsConverterKMMKey.self] = newValue }
  }
}

enum LineMeasureConverterKMMKey: DependencyKey {
  static let liveValue: LineMeasureConverterKMM = .live
  #if DEBUG
  static let testValue: LineMeasureConverterKMM = .test
  #endif
}

public extension DependencyValues {
  var lineMeasureConverterKMM: LineMeasureConverterKMM {
    get { self[LineMeasureConverterKMMKey.self] }
    set { self[LineMeasureConverterKMMKey.self] = newValue }
  }
}

enum WeightScaleConverterKMMKey: DependencyKey {
  static let liveValue: WeightScaleConverterKMM = .live
  #if DEBUG
  static let testValue: WeightScaleConverterKMM = .test
  #endif
}

public extension DependencyValues {
  var weightScaleConverterKMM: WeightScaleConverterKMM {
    get { self[WeightScaleConverterKMMKey.self] }
    set { self[WeightScaleConverterKMMKey.self] = newValue }
  }
}

enum StageConverterKMMKey: DependencyKey {
  static let liveValue: StageConverterKMM = .live
  #if DEBUG
  static let testValue: StageConverterKMM = .test
  #endif
}

public extension DependencyValues {
  var stageConverterKMM: StageConverterKMM {
    get { self[StageConverterKMMKey.self] }
    set { self[StageConverterKMMKey.self] = newValue }
  }
}
