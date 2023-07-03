import Foundation
import ModelConvertible
import fetchRockets

public typealias RocketDetailConverterKMM = ModelConverter<RocketDetail, RocketKMM>
public typealias RocketsDetailConverterKMM = ModelConverter<[RocketDetail], [RocketKMM]>

public typealias LineMeasureConverterKMM = ModelConverter<RocketDetail.LineMeasure, RocketKMM.LineMeasure>
public typealias WeightScaleConverterKMM = ModelConverter<RocketDetail.WeightScale, RocketKMM.WeightScale>
public typealias StageConverterKMM = ModelConverter<RocketDetail.Stage, RocketKMM.Stage>
