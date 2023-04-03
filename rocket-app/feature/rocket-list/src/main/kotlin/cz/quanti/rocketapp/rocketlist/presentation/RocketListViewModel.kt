package cz.quanti.rocketapp.rocketlist.presentation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import cz.quanti.rocketapp.rocketdata.domain.GetRocketsUseCase
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import java.time.LocalDate
import java.time.format.DateTimeFormatter

class RocketListViewModel(private val getRocketsUseCase: GetRocketsUseCase) : ViewModel() {
    private val _rockets = MutableStateFlow(RocketListState())
    val rockets: StateFlow<RocketListState>
        get() = _rockets

    init {
        getRockets()
    }

    private fun getRockets() {
        viewModelScope.launch(Dispatchers.IO) {
            _rockets.value = RocketListState(
                getRocketsUseCase.getRockets().map {
                    RocketItemState(it.id, it.name, formatFirstFlightDate(it.firstFlight))
                }
            )
        }
    }

    private fun formatFirstFlightDate(date: LocalDate): String {
        val formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy")
        return "First flight: ${date.format(formatter)}"
    }
}
