#if DEBUG
import Dependencies
import ModelConvertible
import fetchRockets

public extension RocketDetailConverterKMM {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}

public extension RocketsDetailConverterKMM {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}

public extension LineMeasureConverterKMM {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}

public extension WeightScaleConverterKMM {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}

public extension StageConverterKMM {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}

#endif
