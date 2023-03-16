package com.example.rocket_list.presentation

import androidx.lifecycle.ViewModel
import com.example.rocket_repo.data.rocketsMock
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import java.time.LocalDate
import java.time.format.DateTimeFormatter

class RocketListViewModel : ViewModel() {
    private val _rockets = MutableStateFlow(RocketListState())
    val rockets: StateFlow<RocketListState>
        get() = _rockets

    fun getRockets() {
        _rockets.value = RocketListState(
            rocketsMock.map {
                RocketItemState(it.id, it.name, formatFirstFlightDate(it.firstFlight))
            }
        )
    }

    private fun formatFirstFlightDate(date: LocalDate): String {
        val formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy")
        return "First flight: ${date.format(formatter)}"
    }
}