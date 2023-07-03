import Dependencies
import Foundation
import ModelConvertible
import fetchRockets

public extension LineMeasureKMMConverter {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.LineMeasure(meters: $0.meters, feet: $0.feet)
    }
  )
}

public extension WeightScaleKMMConverter {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.WeightScale(kilograms: $0.kilograms, pounds: $0.pounds)
    }
  )
}

public extension StageKMMConverter {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.Stage(reusable: $0.reusable, engines: Int($0.engines), fuelMass: $0.fuelMass, burnTime: $0.burnTime?.intValue)
    }
  )
}
public extension RocketDetailKMMConverter {
  static var live: Self {
    @Dependency(\.lineMeasureKMMConverter) var lineMeasureKMMConverter
    @Dependency(\.weightScaleKMMConverter) var weightScaleKMMConverter
    @Dependency(\.stageKMMConverter) var stageKMMConverter

    return .init(
      domainModelConverter: { rocketKMM in
        guard
          let height = lineMeasureKMMConverter.domainModel(fromExternal: rocketKMM.height),
          let diameter = lineMeasureKMMConverter.domainModel(fromExternal: rocketKMM.diameter),
          let mass = weightScaleKMMConverter.domainModel(fromExternal: rocketKMM.mass),
          let firstStage = stageKMMConverter.domainModel(fromExternal: rocketKMM.firstStage),
          let secondStage = stageKMMConverter.domainModel(fromExternal: rocketKMM.secondStage)
        else {
          return nil
        }

        return RocketDetail(
          id: rocketKMM.id,
          name: rocketKMM.name,
          overview: rocketKMM.overview,
          height: height,
          diameter: diameter,
          mass: mass,
          firstStage: firstStage,
          secondStage: secondStage,
          firstFlight: rocketKMM.firstFlight,
          photos: rocketKMM.photos
        )
      }
    )
  }
}

public extension RocketsDetailKMMConverter {
  static var live: Self {
    @Dependency(\.rocketKMMConverter) var rocketKMMConverter

    return .init(
      domainModelConverter: { rocketKMM in
        let rockets: [RocketDetail] = rocketKMM.compactMap {
          guard let rocket = rocketKMMConverter.domainModel(fromExternal: $0) else {
            return nil
          }

          return RocketDetail(
            id: rocket.id,
            name: rocket.name,
            overview: rocket.overview,
            height: rocket.height,
            diameter: rocket.diameter,
            mass: rocket.mass,
            firstStage: rocket.firstStage,
            secondStage: rocket.secondStage,
            firstFlight: rocket.firstFlight,
            photos: rocket.photos
          )
        }

        guard rocketKMM.count == rockets.count else {
            return nil
        }

        return rockets
      }
    )
  }
}
