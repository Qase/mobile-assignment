package com.example.rocketapp.api.dto
import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass


@JsonClass(generateAdapter = true)
data class RocketItemDto(
    @Json(name = "active")
    val active: Boolean,
    @Json(name = "boosters")
    val boosters: Int,
    @Json(name = "company")
    val company: String,
    @Json(name = "cost_per_launch")
    val costPerLaunch: Int,
    @Json(name = "country")
    val country: String,
    @Json(name = "description")
    val description: String,
    @Json(name = "diameter")
    val diameter: DiameterDto,
    @Json(name = "engines")
    val engines: Engines,
    @Json(name = "first_flight")
    val firstFlight: String,
    @Json(name = "first_stage")
    val firstStage: FirstStageDto,
    @Json(name = "flickr_images")
    val flickrImages: List<String>,
    @Json(name = "height")
    val height: HeightDto,
    @Json(name = "id")
    val id: Int,
    @Json(name = "landing_legs")
    val landingLegs: LandingLegsDto,
    @Json(name = "mass")
    val mass: MassDto,
    @Json(name = "payload_weights")
    val payloadWeights: List<PayloadWeightDto>,
    @Json(name = "rocket_id")
    val rocketId: String,
    @Json(name = "rocket_name")
    val rocketName: String,
    @Json(name = "rocket_type")
    val rocketType: String,
    @Json(name = "second_stage")
    val secondStage: SecondStageDto,
    @Json(name = "stages")
    val stages: Int,
    @Json(name = "success_rate_pct")
    val successRatePct: Int,
    @Json(name = "wikipedia")
    val wikipedia: String
)

@JsonClass(generateAdapter = true)
data class DiameterDto(
    @Json(name = "feet")
    val feet: Double,
    @Json(name = "meters")
    val meters: Double
)

@JsonClass(generateAdapter = true)
data class Engines(
    @Json(name = "engine_loss_max")
    val engineLossMax: Any?,
    @Json(name = "isp")
    val isp: Isp,
    @Json(name = "layout")
    val layout: Any?,
    @Json(name = "number")
    val number: Int,
    @Json(name = "propellant_1")
    val propellant1: String,
    @Json(name = "propellant_2")
    val propellant2: String,
    @Json(name = "thrust_sea_level")
    val thrustSeaLevel: ThrustSeaLevelDto,
    @Json(name = "thrust_to_weight")
    val thrustToWeight: Double,
    @Json(name = "thrust_vacuum")
    val thrustVacuum: ThrustVacuumDto,
    @Json(name = "type")
    val type: String,
    @Json(name = "version")
    val version: String
)

@JsonClass(generateAdapter = true)
data class FirstStageDto(
    @Json(name = "burn_time_sec")
    val burnTimeSec: Int?,
    @Json(name = "engines")
    val engines: Int,
    @Json(name = "fuel_amount_tons")
    val fuelAmountTons: Double,
    @Json(name = "reusable")
    val reusable: Boolean,
    @Json(name = "thrust_sea_level")
    val thrustSeaLevel: ThrustSeaLevelXDto,
    @Json(name = "thrust_vacuum")
    val thrustVacuum: ThrustVacuumXDto
)

@JsonClass(generateAdapter = true)
data class HeightDto(
    @Json(name = "feet")
    val feet: Double,
    @Json(name = "meters")
    val meters: Double
)

@JsonClass(generateAdapter = true)
data class LandingLegsDto(
    @Json(name = "material")
    val material: String?,
    @Json(name = "number")
    val number: Int
)

@JsonClass(generateAdapter = true)
data class MassDto(
    @Json(name = "kg")
    val kg: Double,
    @Json(name = "lb")
    val lb: Double
)

@JsonClass(generateAdapter = true)
data class PayloadWeightDto(
    @Json(name = "id")
    val id: String,
    @Json(name = "kg")
    val kg: Int,
    @Json(name = "lb")
    val lb: Int,
    @Json(name = "name")
    val name: String
)

@JsonClass(generateAdapter = true)
data class SecondStageDto(
    @Json(name = "burn_time_sec")
    val burnTimeSec: Int?,
    @Json(name = "engines")
    val engines: Int,
    @Json(name = "fuel_amount_tons")
    val fuelAmountTons: Double,
    @Json(name = "payloads")
    val payloads: PayloadsDto,
    @Json(name = "reusable")
    val reusable: Boolean,
    @Json(name = "thrust")
    val thrust: ThrustDto
)

@JsonClass(generateAdapter = true)
data class Isp(
    @Json(name = "sea_level")
    val seaLevel: Int,
    @Json(name = "vacuum")
    val vacuum: Int
)

@JsonClass(generateAdapter = true)
data class ThrustSeaLevelDto(
    @Json(name = "kN")
    val kN: Int,
    @Json(name = "lbf")
    val lbf: Int
)

@JsonClass(generateAdapter = true)
data class ThrustVacuumDto(
    @Json(name = "kN")
    val kN: Int,
    @Json(name = "lbf")
    val lbf: Int
)

@JsonClass(generateAdapter = true)
data class ThrustSeaLevelXDto(
    @Json(name = "kN")
    val kN: Int,
    @Json(name = "lbf")
    val lbf: Int
)

@JsonClass(generateAdapter = true)
data class ThrustVacuumXDto(
    @Json(name = "kN")
    val kN: Int,
    @Json(name = "lbf")
    val lbf: Int
)

@JsonClass(generateAdapter = true)
data class PayloadsDto(
    @Json(name = "composite_fairing")
    val compositeFairing: CompositeFairingDto,
    @Json(name = "option_1")
    val option1: String,
    @Json(name = "option_2")
    val option2: String?
)

@JsonClass(generateAdapter = true)
data class ThrustDto(
    @Json(name = "kN")
    val kN: Int,
    @Json(name = "lbf")
    val lbf: Int
)

@JsonClass(generateAdapter = true)
data class CompositeFairingDto(
    @Json(name = "diameter")
    val diameter: DiameterXDto,
    @Json(name = "height")
    val height: HeightXDto
)

@JsonClass(generateAdapter = true)
data class DiameterXDto(
    @Json(name = "feet")
    val feet: Any?,
    @Json(name = "meters")
    val meters: Any?
)

@JsonClass(generateAdapter = true)
data class HeightXDto(
    @Json(name = "feet")
    val feet: Any?,
    @Json(name = "meters")
    val meters: Any?
)