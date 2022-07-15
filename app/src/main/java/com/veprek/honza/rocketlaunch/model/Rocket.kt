package com.veprek.honza.rocketlaunch.model

class Rocket(
    val id: String,
    val active: Boolean,
    val name: String,
    val firstFlight: String,
    val description: String,
    val height: Int,
    val diameter: Int,
    val mass: Int,
    val reusable: Boolean,
    val engines: Int,
    val FuelAmountTons: Int,
    val BurnTImeSec: Int
)
