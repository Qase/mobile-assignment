import Dependencies
@testable import RocketsClient
import XCTest

final class RocketDetailConverterLiveTests: XCTestCase {
  func test_lineMeasureConverter() {
    withDependencies {
      $0.lineMeasureConverter = .live
    } operation: {
      @Dependency(\.lineMeasureConverter) var lineMeasureConverter

      let rocketHeightDTO = RocketDetailDTO.LineMeasure(meters: 20.0, feet: 65.6)
      let rocketHeightDomain = lineMeasureConverter.domainModel(fromExternal: rocketHeightDTO)

      XCTAssertEqual(rocketHeightDomain?.meters, 20.0)
      XCTAssertEqual(rocketHeightDomain?.feet, 65.6)
    }
  }

  func test_weightScaleConverter() {
    withDependencies {
      $0.weightScaleConverter = .live
    } operation: {
      @Dependency(\.weightScaleConverter) var weightScaleConverter

      let rocketWeightDTO = RocketDetailDTO.WeightScale(kilograms: 10.0, pounds: 22.5)
      let rocketWeightDomain = weightScaleConverter.domainModel(fromExternal: rocketWeightDTO)

      XCTAssertEqual(rocketWeightDomain?.kilograms, 10.0)
      XCTAssertEqual(rocketWeightDomain?.pounds, 22.5)
    }
  }

  func test_stageConverter() {
    withDependencies {
      $0.stageConverter = .live
    } operation: {
      @Dependency(\.stageConverter) var stageConverter

      let rocketStageDTO = RocketDetailDTO.Stage(reusable: true, engines: 5, fuelMass: 1000.0, burnTime: nil)
      let rocketStageDomain = stageConverter.domainModel(fromExternal: rocketStageDTO)

      XCTAssertEqual(rocketStageDomain?.reusable, true)
      XCTAssertEqual(rocketStageDomain?.engines, 5)
      XCTAssertEqual(rocketStageDomain?.fuelMass, 1000.0)
      XCTAssertNil(rocketStageDomain?.burnTime)
    }
  }

  func test_RocketsConverter() {
    withDependencies {
      $0.lineMeasureConverter = .live
      $0.weightScaleConverter = .live
      $0.stageConverter = .live
      $0.rocketConverter = .live
    } operation: {
      @Dependency(\.rocketConverter) var rocketConverter

      let rocketDetailDTO = RocketDetailDTO(
        id: "apollo13",
        name: "Apollo 13",
        overview: "Apollo 13 is the timeless rocket with strong phase shields.",
        height: .init(meters: 130, feet: 426.4),
        diameter: .init(meters: 20.2, feet: 66.26),
        mass: .init(kilograms: 150, pounds: 330.7),
        firstStage: .init(reusable: true, engines: 9, fuelMass: 350, burnTime: 162),
        secondStage: .init(reusable: true, engines: 9, fuelMass: 350, burnTime: 162),
        firstFlight: "1991-03-09",
        photos: ["https://imgur.com/DaCfMsj.jpg", "https://imgur.com/azYafd8.jpg"]
      )
      let rocketDetailDomain = rocketConverter.domainModel(fromExternal: rocketDetailDTO)

      XCTAssertEqual(rocketDetailDomain?.id, "apollo13")
      XCTAssertEqual(rocketDetailDomain?.name, "Apollo 13")
      XCTAssertEqual(rocketDetailDomain?.overview, "Apollo 13 is the timeless rocket with strong phase shields.")
      XCTAssertEqual(rocketDetailDomain?.firstFlight, "1991-03-09")
      XCTAssertEqual(rocketDetailDomain?.photos, ["https://imgur.com/DaCfMsj.jpg", "https://imgur.com/azYafd8.jpg"])
    }
  }
}
