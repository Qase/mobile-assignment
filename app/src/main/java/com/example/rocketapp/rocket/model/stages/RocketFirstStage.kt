package com.example.rocketapp.rocket.model.stages

data class RocketFirstStage(
    val reusable: Boolean,
    val engines: Int,
    val fuelAmountTons: Double,
    val burnTimeSec: Int?
)
