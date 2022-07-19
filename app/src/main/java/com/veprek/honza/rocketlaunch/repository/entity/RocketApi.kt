package com.veprek.honza.rocketlaunch.repository.entity

import com.squareup.moshi.Json

data class RocketApi(
    @Json(name = "id")
    val id: String,
    @Json(name = "active")
    val active: Boolean,
    @Json(name = "name")
    val name: String?,
    @Json(name = "first_flight")
    val firstFlight: String?,
    @Json(name = "description")
    val description: String?,
    @Json(name = "height")
    val height: HeightApi,
    @Json(name = "diameter")
    val diameter: HeightApi,
    @Json(name = "mass")
    val mass: MassApi,
    @Json(name = "first_stage")
    val firstStage: StageApi,
    @Json(name = "second_stage")
    val secondStage: StageApi,
    @Json(name = "flickr_images")
    val images: List<String>
)

data class HeightApi(
    @Json(name = "feet")
    val feet: Double,
    @Json(name = "meters")
    val meters: Double
)

data class MassApi(
    @Json(name = "kg")
    val kg: Int,
    @Json(name = "lb")
    val lb: Int
)

data class StageApi(
    @Json(name = "reusable")
    val reusable: Boolean,
    @Json(name = "engines")
    val engines: Int?,
    @Json(name = "fuel_amount_tons")
    val fuelAmountTons: Double?,
    @Json(name = "burn_time_sec")
    val burnTimeSec: Double?
)
