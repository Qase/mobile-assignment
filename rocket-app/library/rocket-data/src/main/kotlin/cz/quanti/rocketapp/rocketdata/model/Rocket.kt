package cz.quanti.rocketapp.rocketdata.model

import java.time.LocalDate

data class Rocket(
    val id: Int,
    val name: String,
    val firstFlight: LocalDate,
    val overview: String,
    val parameters: RocketParameters
)
