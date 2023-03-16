package com.example.rocket_list.presentation


data class RocketListState(
    val rockets: List<RocketListState> = emptyList()
)

data class RocketItemState(
    val id: String,
    val name: String,
    val firstFlight: String
)