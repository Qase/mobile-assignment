package com.veprek.honza.rocketlaunch.model

import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class Stage(
    val reusable: Boolean,
    val engines: Int,
    val fuelAmountTons: Int,
    val burnTimeSec: Int
)
