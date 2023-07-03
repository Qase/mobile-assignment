import Dependencies
@testable import RocketsClient
import XCTest
import fetchRockets

final class RocketDetailConverterKMMLiveTests: XCTestCase {
  func test_lineMeasureConverter() {
    withDependencies {
      $0.lineMeasureConverterKMM = .live
    } operation: {
      @Dependency(\.lineMeasureConverterKMM) var lineMeasureConverterKMM

      let rocketDetailKMM = RocketKMM.LineMeasure(meters: 20.0, feet: 65.6)
      let rocketHeightDomain = lineMeasureConverterKMM.domainModel(fromExternal: rocketDetailKMM)

      XCTAssertEqual(rocketHeightDomain?.meters, 20.0)
      XCTAssertEqual(rocketHeightDomain?.feet, 65.6)
    }
  }

  func test_weightScaleConverter() {
    withDependencies {
      $0.weightScaleConverterKMM = .live
    } operation: {
      @Dependency(\.weightScaleConverterKMM) var weightScaleConverterKMM

      let rocketWeightKMM = RocketKMM.WeightScale(kilograms: 10.0, pounds: 22.5)
      let rocketWeightDomain = weightScaleConverterKMM.domainModel(fromExternal: rocketWeightKMM)

      XCTAssertEqual(rocketWeightDomain?.kilograms, 10.0)
      XCTAssertEqual(rocketWeightDomain?.pounds, 22.5)
    }
  }

  func test_stageConverter() {
    withDependencies {
      $0.stageConverterKMM = .live
    } operation: {
      @Dependency(\.stageConverterKMM) var stageConverterKMM

      let rocketStageKMM = RocketKMM.Stage(reusable: true, engines: 5, fuelMass: 1000.0, burnTime: nil)
      let rocketStageDomain = stageConverterKMM.domainModel(fromExternal: rocketStageKMM)

      XCTAssertEqual(rocketStageDomain?.reusable, true)
      XCTAssertEqual(rocketStageDomain?.engines, 5)
      XCTAssertEqual(rocketStageDomain?.fuelMass, 1000.0)
      XCTAssertNil(rocketStageDomain?.burnTime)
    }
  }

  func test_RocketsConverter() {
    withDependencies {
      $0.lineMeasureConverterKMM = .live
      $0.weightScaleConverterKMM = .live
      $0.stageConverterKMM = .live
      $0.rocketConverterKMM = .live
    } operation: {
      @Dependency(\.rocketConverterKMM) var rocketConverterKMM

      let rocketDetailKMM = RocketKMM(
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
      let rocketDetailDomain = rocketConverterKMM.domainModel(fromExternal: rocketDetailKMM)

      XCTAssertEqual(rocketDetailDomain?.id, "apollo13")
      XCTAssertEqual(rocketDetailDomain?.name, "Apollo 13")
      XCTAssertEqual(rocketDetailDomain?.overview, "Apollo 13 is the timeless rocket with strong phase shields.")
      XCTAssertEqual(rocketDetailDomain?.firstFlight, "1991-03-09")
      XCTAssertEqual(rocketDetailDomain?.photos, ["https://imgur.com/DaCfMsj.jpg", "https://imgur.com/azYafd8.jpg"])
    }
  }
}
