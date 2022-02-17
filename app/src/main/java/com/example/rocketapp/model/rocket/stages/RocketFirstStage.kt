package com.example.rocketapp.model.rocket.stages

data class RocketFirstStage(
    val reusable: Boolean,
    val engines: Int,
    val fuelAmountTons: Int,
    val burnTimeSec: Int?
)
