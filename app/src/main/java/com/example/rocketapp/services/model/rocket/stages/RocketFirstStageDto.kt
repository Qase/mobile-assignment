package com.example.rocketapp.services.model.rocket.stages

data class RocketFirstStageDto(
    val reusable: Boolean,
    val engines: Int,
    val fuelAmountTons: Int,
    val burnTimeSec: Int
)
