#if DEBUG
import Dependencies
import ModelConvertible
import KMMmodule

public extension RocketDetailConverter {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}

public extension RocketsDetailConverter {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}

public extension LineMeasureConverter {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}

public extension WeightScaleConverter {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}

public extension StageConverter {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}


//KMM

public extension RocketDetailConverter2 {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}

public extension RocketsDetailConverter2 {
  static let test = Self(
    externalModelConverter: unimplemented("\(Self.self).externalModelConverter"),
    domainModelConverter: unimplemented("\(Self.self).domainModelConverter")
  )
}
#endif
