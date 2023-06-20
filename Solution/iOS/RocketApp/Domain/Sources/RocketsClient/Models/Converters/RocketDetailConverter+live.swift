import Dependencies
import Foundation
import ModelConvertible
import KMMmodule

public extension RocketDetailConverter {
  static var live: Self {
    @Dependency(\.lineMeasureConverter) var lineMeasureConverter
    @Dependency(\.weightScaleConverter) var weightScaleConverter
    @Dependency(\.stageConverter) var stageConverter

    return .init(
      domainModelConverter: { rocketDTO in
        guard
          let height = lineMeasureConverter.domainModel(fromExternal: rocketDTO.height),
          let diameter = lineMeasureConverter.domainModel(fromExternal: rocketDTO.diameter),
          let mass = weightScaleConverter.domainModel(fromExternal: rocketDTO.mass),
          let firstStage = stageConverter.domainModel(fromExternal: rocketDTO.firstStage),
          let secondStage = stageConverter.domainModel(fromExternal: rocketDTO.secondStage)
        else {
          return nil
        }

        return RocketDetail(
          id: rocketDTO.id,
          name: rocketDTO.name,
          overview: rocketDTO.overview,
          height: height,
          diameter: diameter,
          mass: mass,
          firstStage: firstStage,
          secondStage: secondStage,
          firstFlight: rocketDTO.firstFlight,
          photos: rocketDTO.photos
        )
      }
    )
  }
}

public extension RocketsDetailConverter {
  static var live: Self {
    @Dependency(\.rocketConverter) var rocketConverter

    return .init(
      domainModelConverter: { rocketsDTO in
        let rockets: [RocketDetail] = rocketsDTO.compactMap {
          guard let rocket = rocketConverter.domainModel(fromExternal: $0) else {
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

        guard rocketsDTO.count == rockets.count else {
            return nil
        }

        return rockets
      }
    )
  }
}

public extension LineMeasureConverter {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.LineMeasure(meters: $0.meters, feet: $0.feet)
    }
  )
}

public extension WeightScaleConverter {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.WeightScale(kilograms: $0.kilograms, pounds: $0.pounds)
    }
  )
}

public extension StageConverter {
  static var live = Self(
    domainModelConverter: {
      RocketDetail.Stage(reusable: $0.reusable, engines: $0.engines, fuelMass: $0.fuelMass, burnTime: $0.burnTime)
    }
  )
}


//KMM
public extension RocketDetailConverter2 {
  static var live: Self {
//    @Dependency(\.lineMeasureConverter) var lineMeasureConverter
//    @Dependency(\.weightScaleConverter) var weightScaleConverter
    @Dependency(\.stageConverter) var stageConverter

    return .init(
      domainModelConverter: { rocketDTO in
//        guard
//          let height = lineMeasureConverter.domainModel(fromExternal: rocketDTO.height),
//          let diameter = lineMeasureConverter.domainModel(fromExternal: rocketDTO.diameter),
//          let mass = weightScaleConverter.domainModel(fromExternal: rocketDTO.mass),
//          let firstStage = stageConverter.domainModel(fromExternal: rocketDTO.firstStage),
//          let secondStage = stageConverter.domainModel(fromExternal: rocketDTO.secondStage)
//          let height = rocketDTO.diameter
//        else {
//          return nil
//        }

        return RocketDetail(
          id: rocketDTO.id,
          name: rocketDTO.name,
          overview: rocketDTO.description_,
          height: RocketDetail.LineMeasure(meters: rocketDTO.diameter.meters as! Float, feet: rocketDTO.diameter.feet as! Float),
          diameter: RocketDetail.LineMeasure(meters: rocketDTO.diameter.meters as! Float, feet: rocketDTO.diameter.feet as! Float),
          mass: RocketDetail.WeightScale(kilograms: Float(rocketDTO.mass.kg), pounds: Float(rocketDTO.mass.lb)),
          firstStage:
            RocketDetail.Stage(
              reusable: rocketDTO.firstStage.reusable,
              engines: Int(rocketDTO.firstStage.engines),
              fuelMass: Float(rocketDTO.firstStage.fuelAmountTons),
              burnTime: rocketDTO.firstStage.burnTimeSEC as? Int
            ),
          secondStage:
            RocketDetail.Stage(
              reusable: rocketDTO.firstStage.reusable,
              engines: Int(rocketDTO.firstStage.engines),
              fuelMass: Float(rocketDTO.firstStage.fuelAmountTons),
              burnTime: (rocketDTO.firstStage.burnTimeSEC as? Int)
            ),
          firstFlight: rocketDTO.firstFlight,
          photos: rocketDTO.flickrImages
        )
      }
    )
  }
}

public extension RocketsDetailConverter2 {
  static var live: Self {
    @Dependency(\.rocketConverter2) var rocketConverter2

    return .init(
      domainModelConverter: { rocketsDTO in
        let rockets: [RocketDetail] = rocketsDTO.compactMap {
          guard let rocket = rocketConverter2.domainModel(fromExternal: $0) else {
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

        guard rocketsDTO.count == rockets.count else {
            return nil
        }

        return rockets
      }
    )
  }
}
