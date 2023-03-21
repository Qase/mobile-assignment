package cz.quanti.rocketapp.rocketdata.data

import com.google.gson.annotations.SerializedName


data class RocketResponse(
    @SerializedName("id")
    val id: Int,
    @SerializedName("rocket_name")
    val name: String,
    @SerializedName("first_flight")
    val firstFlight: String
)