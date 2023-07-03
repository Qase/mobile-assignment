import Dependencies
import Foundation
import ModelConvertible

enum RocketKMMConverterKey: DependencyKey {
  static let liveValue: RocketDetailKMMConverter = .live
  #if DEBUG
  static let testValue: RocketDetailKMMConverter = .test
  #endif
}

public extension DependencyValues {
  var rocketKMMConverter: RocketDetailKMMConverter {
    get { self[RocketKMMConverterKey.self] }
    set { self[RocketKMMConverterKey.self] = newValue }
  }
}

enum RocketsKMMConverterKey: DependencyKey {
  static let liveValue: RocketsDetailKMMConverter = .live
  #if DEBUG
  static let testValue: RocketsDetailKMMConverter = .test
  #endif
}

public extension DependencyValues {
  var rocketsKMMConverter: RocketsDetailKMMConverter {
    get { self[RocketsKMMConverterKey.self] }
    set { self[RocketsKMMConverterKey.self] = newValue }
  }
}

enum LineMeasureKMMConverterKey: DependencyKey {
  static let liveValue: LineMeasureKMMConverter = .live
  #if DEBUG
  static let testValue: LineMeasureKMMConverter = .test
  #endif
}

public extension DependencyValues {
  var lineMeasureKMMConverter: LineMeasureKMMConverter {
    get { self[LineMeasureKMMConverterKey.self] }
    set { self[LineMeasureKMMConverterKey.self] = newValue }
  }
}

enum WeightScaleKMMConverterKey: DependencyKey {
  static let liveValue: WeightScaleKMMConverter = .live
  #if DEBUG
  static let testValue: WeightScaleKMMConverter = .test
  #endif
}

public extension DependencyValues {
  var weightScaleKMMConverter: WeightScaleKMMConverter {
    get { self[WeightScaleKMMConverterKey.self] }
    set { self[WeightScaleKMMConverterKey.self] = newValue }
  }
}

enum StageKMMConverterKey: DependencyKey {
  static let liveValue: StageKMMConverter = .live
  #if DEBUG
  static let testValue: StageKMMConverter = .test
  #endif
}

public extension DependencyValues {
  var stageKMMConverter: StageKMMConverter {
    get { self[StageKMMConverterKey.self] }
    set { self[StageKMMConverterKey.self] = newValue }
  }
}
