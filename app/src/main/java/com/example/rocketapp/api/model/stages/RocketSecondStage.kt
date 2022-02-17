package com.example.rocketapp.api.model.stages

data class RocketSecondStage(
    val reusable: Boolean,
    val engines: Int,
    val fuelAmountTons: Double,
    val burnTimeSec: Int?
)