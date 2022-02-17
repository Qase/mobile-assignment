package com.example.rocketapp.rocket.rocket.stages

data class RocketFirstStage(
    val reusable: Boolean,
    val engines: Int,
    val fuelAmountTons: Double,
    val burnTimeSec: Int?
)
