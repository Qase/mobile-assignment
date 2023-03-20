package com.example.rocket_repo.model

import java.time.LocalDate

data class Rocket(
    val id: String,
    val name: String,
    val firstFlight: LocalDate,
    val overview: String,
    val parameters: RocketParameters
)
