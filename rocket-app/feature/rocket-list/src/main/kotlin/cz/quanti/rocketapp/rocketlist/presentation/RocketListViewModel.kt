package cz.quanti.rocketapp.rocketlist.presentation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import cz.quanti.rocketapp.rocketdata.domain.getRocketsUseCase
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import java.time.format.DateTimeFormatter

class RocketListViewModel : ViewModel() {
    private val _rockets = MutableStateFlow(RocketListState())
    val rockets: StateFlow<RocketListState>
        get() = _rockets

    init {
        getRockets()
    }

    private fun getRockets() {
        viewModelScope.launch(Dispatchers.IO) {
            _rockets.value = RocketListState(
                getRocketsUseCase().map {
                    RocketItemState(it.id, it.name, it.firstFlight)
                }
            )
        }
    }

    private fun formatFirstFlightDate(date: String): String {
        val formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy")
        return "First flight: ${date.format(formatter)}"
    }
}