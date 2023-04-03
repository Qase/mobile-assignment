package cz.quanti.rocketapp.rocketlist.presentation

data class RocketListState(
    val rockets: List<RocketItemState> = emptyList()
)
data class RocketItemState(
    val id: Int,
    val name: String,
    val firstFlight: String
)
