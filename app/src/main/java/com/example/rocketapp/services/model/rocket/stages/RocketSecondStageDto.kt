package com.example.rocketapp.services.model.rocket.stages

data class RocketSecondStageDto(
    val reusable: Boolean,
    val engines: Int,
    val fuelAmountTons: Int,
    val burnTimeSec: Int
)