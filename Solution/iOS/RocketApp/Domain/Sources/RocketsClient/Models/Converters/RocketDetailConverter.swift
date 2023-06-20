import Foundation
import ModelConvertible
import KMMmodule

public typealias RocketDetailConverter = ModelConverter<RocketDetail, RocketDetailDTO>
public typealias RocketsDetailConverter = ModelConverter<[RocketDetail], [RocketDetailDTO]>

public typealias LineMeasureConverter = ModelConverter<RocketDetail.LineMeasure, RocketDetailDTO.LineMeasure>
public typealias WeightScaleConverter = ModelConverter<RocketDetail.WeightScale, RocketDetailDTO.WeightScale>
public typealias StageConverter = ModelConverter<RocketDetail.Stage, RocketDetailDTO.Stage>

//Converters for KMM
public typealias RocketDetailConverter2 = ModelConverter<RocketDetail, Rocket>
public typealias RocketsDetailConverter2 = ModelConverter<[RocketDetail], [Rocket]>

//public typealias LineMeasureConverter2 = ModelConverter<RocketDetail.LineMeasure, Rocket.>
//public typealias WeightScaleConverter2 = ModelConverter<RocketDetail.WeightScale, Rocket.Mass>
//public typealias StageConverter2 = ModelConverter<RocketDetail.Stage, Rocket.Stage>
