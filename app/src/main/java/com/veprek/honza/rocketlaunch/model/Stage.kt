package com.veprek.honza.rocketlaunch.model

import com.squareup.moshi.Json

data class Stage(
    @Json(name = "reusable")
    val reusable: Boolean,
    @Json(name = "engines")
    val engines: Int,
    @Json(name = "fuel_amount_tons")
    val FuelAmountTons: Double,
    @Json(name = "burn_time_sec")
    val BurnTimeSec: Double?
)
