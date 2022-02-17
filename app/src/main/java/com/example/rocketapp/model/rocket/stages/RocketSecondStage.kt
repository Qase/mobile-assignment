package com.example.rocketapp.model.rocket.stages

data class RocketSecondStage(
    val reusable: Boolean,
    val engines: Int,
    val fuelAmountTons: Double,
    val burnTimeSec: Int?
)