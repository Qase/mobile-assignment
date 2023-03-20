package cz.quanti.rocket_app.rocket_list.presentation

data class RocketListState(
    val rockets: List<RocketItemState> = emptyList()
)
data class RocketItemState(
    val id: String,
    val name: String,
    val firstFlight: String
)