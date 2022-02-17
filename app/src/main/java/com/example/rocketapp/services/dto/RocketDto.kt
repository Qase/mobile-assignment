package com.example.rocketapp.services.dto

class RocketListDto: ArrayList<RocketDto>()

data class RocketDto(
    val active: Boolean,
    val boosters: Int,
    val company: String,
    val cost_per_launch: Int,
    val country: String,
    val description: String,
    val diameter: DiameterDto,
    val engines: EnginesDto,
    val first_flight: String,
    val first_stage: FirstStageDto,
    val flickr_images: List<String>,
    val height: HeightDto,
    val id: Int,
    val landing_legs: LandingLegsDto,
    val mass: MassDto,
    val payload_weights: List<PayloadWeightDto>,
    val rocket_id: String,
    val rocket_name: String,
    val rocket_type: String,
    val second_stage: SecondStageDto,
    val stages: Int,
    val success_rate_pct: Int,
    val wikipedia: String
)

data class DiameterDto(
    val feet: Int,
    val meters: Int
)

data class EnginesDto(
    val engine_loss_max: Int?,
    val isp: IspDto,
    val layout: String?,
    val number: Int,
    val propellant_1: String,
    val propellant_2: String,
    val thrust_sea_level: ThrustSeaLevelDto,
    val thrust_to_weight: Int,
    val thrust_vacuum: ThrustVacuumDto,
    val type: String,
    val version: String
)

data class FirstStageDto(
    val burn_time_sec: Int?,
    val engines: Int,
    val fuel_amount_tons: Int,
    val reusable: Boolean,
    val thrust_sea_level: ThrustSeaLevelXDto,
    val thrust_vacuum: ThrustVacuumXDto
)

data class HeightDto(
    val feet: Int,
    val meters: Int
)

data class LandingLegsDto(
    val material: String,
    val number: Int
)

data class MassDto(
    val kg: Int,
    val lb: Int
)

data class PayloadWeightDto(
    val id: String,
    val kg: Int,
    val lb: Int,
    val name: String
)

data class SecondStageDto(
    val burn_time_sec: Int?,
    val engines: Int,
    val fuel_amount_tons: Int,
    val payloads: PayloadsDto,
    val reusable: Boolean,
    val thrust: ThrustDto
)

data class IspDto(
    val sea_level: Int,
    val vacuum: Int
)

data class ThrustSeaLevelDto(
    val kN: Int,
    val lbf: Int
)

data class ThrustVacuumDto(
    val kN: Int,
    val lbf: Int
)

data class ThrustSeaLevelXDto(
    val kN: Int,
    val lbf: Int
)

data class ThrustVacuumXDto(
    val kN: Int,
    val lbf: Int
)

data class PayloadsDto(
    val composite_fairing: CompositeFairingDto,
    val option_1: String,
    val option_2: String
)

data class ThrustDto(
    val kN: Int,
    val lbf: Int
)

data class CompositeFairingDto(
    val diameter: DiameterXDto,
    val height: HeightXDto
)

data class DiameterXDto(
    val feet: Any,
    val meters: Any
)

data class HeightXDto(
    val feet: Any,
    val meters: Any
)