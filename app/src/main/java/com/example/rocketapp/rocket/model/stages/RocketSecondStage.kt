package com.example.rocketapp.rocket.model.stages

data class RocketSecondStage(
    val reusable: Boolean,
    val engines: Int,
    val fuelAmountTons: Double,
    val burnTimeSec: Int?
)