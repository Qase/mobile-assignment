import Foundation
import ModelConvertible
import fetchRockets

public typealias RocketDetailKMMConverter = ModelConverter<RocketDetail, RocketKMM>
public typealias RocketsDetailKMMConverter = ModelConverter<[RocketDetail], [RocketKMM]>

public typealias LineMeasureKMMConverter = ModelConverter<RocketDetail.LineMeasure, RocketKMM.LineMeasure>
public typealias WeightScaleKMMConverter = ModelConverter<RocketDetail.WeightScale, RocketKMM.WeightScale>
public typealias StageKMMConverter = ModelConverter<RocketDetail.Stage, RocketKMM.Stage>
