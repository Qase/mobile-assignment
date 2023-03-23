package cz.quanti.rocketapp.rocketdata.model


data class Rocket(
    val id: Int,
    val name: String,
    val firstFlight: String,
    val overview: String,
    val parameters: RocketParameters
)
