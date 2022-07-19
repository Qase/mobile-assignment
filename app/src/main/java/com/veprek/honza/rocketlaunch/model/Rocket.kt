package com.veprek.honza.rocketlaunch.model

data class Rocket(
    val id: String,
    val active: Boolean,
    val name: String,
    val firstFlight: String,
    val description: String,
    val height: Height,
    val diameter: Height,
    val mass: Mass,
    val firstStage: Stage,
    val secondStage: Stage,
    val images: List<String>
)

data class Height(
    val feet: Int,
    val meters: Int
)

data class Mass(
    val t: Int,
    val lb: Int
)
