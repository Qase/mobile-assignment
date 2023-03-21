package cz.quanti.rocketapp.rocketdata.model

import cz.quanti.rocketapp.rocketdata.data.RocketResponse
import cz.quanti.rocketapp.rocketdata.data.rocketParameters

data class Rocket(
    val id: Int,
    val name: String,
    val firstFlight: String,
    val overview: String,
    val parameters: RocketParameters
) {
    constructor(rocketResponse: RocketResponse) : this(
        rocketResponse.id,
        rocketResponse.name,
        rocketResponse.firstFlight,
        "",
        rocketParameters
    )
}
