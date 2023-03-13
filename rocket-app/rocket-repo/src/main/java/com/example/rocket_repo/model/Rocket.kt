package com.example.rocket_repo.model

import java.util.Date

data class Rocket(
    val name: String,
    val firstFlight: Date,
    val overview: String,
    val parameters: RocketParameters
)
