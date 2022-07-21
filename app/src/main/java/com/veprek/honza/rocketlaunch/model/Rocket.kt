package com.veprek.honza.rocketlaunch.model

import androidx.room.Entity
import androidx.room.PrimaryKey
import com.squareup.moshi.JsonClass

@Entity
data class Rocket(
    @PrimaryKey
    val id: String,
    val active: Boolean,
    val name: String,
    val firstFlight: String,
    val description: String,
    val height: Height,
    val diameter: Height,
    val mass: Mass,
    val firstStage: Stage,
    val secondStage: Stage,
    val images: List<String>
)

@JsonClass(generateAdapter = true)
data class Height(
    val feet: Int,
    val meters: Int
)

@JsonClass(generateAdapter = true)
data class Mass(
    val t: Int,
    val lb: Int
)
