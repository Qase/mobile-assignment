package com.veprek.honza.rocketlaunch.model

import com.squareup.moshi.Json

data class Rocket(
    @Json(name = "id")
    val id: String,
    @Json(name = "active")
    val active: Boolean,
    @Json(name = "name")
    val name: String,
    @Json(name = "first_flight")
    val firstFlight: String,
    @Json(name = "description")
    val description: String,
    @Json(name = "height")
    val height: Height,
    @Json(name = "diameter")
    val diameter: Height,
    @Json(name = "mass")
    val mass: Mass,
    @Json(name = "first_stage")
    val firstStage: Stage,
    @Json(name = "second_stage")
    val secondStage: Stage,
    @Json(name = "flickr_images")
    val images: List<String>
)

data class Height(
    @Json(name = "feet")
    val feet: Double,
    @Json(name = "meters")
    val meters: Double
)

data class Mass(
    @Json(name = "kg")
    val kg: Int,
    @Json(name = "lb")
    val lb: Int
)
