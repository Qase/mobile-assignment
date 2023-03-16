package com.example.rocket_list.presentation

import androidx.lifecycle.ViewModel
import com.example.rocket_repo.data.rocketsMock
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import java.time.LocalDate
import java.time.format.DateTimeFormatter

class RocketListViewModel : ViewModel() {
    private val _rockets = MutableStateFlow<List<RocketItemState>>(emptyList())
    val rockets: StateFlow<List<RocketItemState>>
        get() = _rockets

    fun getRockets() {

        _rockets.value = rocketsMock.map {
            RocketItemState(it.id, it.name, formatFirstFlightDate(it.firstFlight))
        }
    }

    private fun formatFirstFlightDate(date: LocalDate): String {
        val formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy")
        return "First flight: ${date.format(formatter)}"
    }
}