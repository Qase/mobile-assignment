package com.veprek.honza.rocketlaunch.model

data class Stage(
    val reusable: Boolean,
    val engines: Int,
    val FuelAmountTons: Int,
    val BurnTimeSec: Int
)
