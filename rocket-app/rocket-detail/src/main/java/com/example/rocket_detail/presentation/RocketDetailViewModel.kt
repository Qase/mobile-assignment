package com.example.rocket_detail.presentation

import androidx.lifecycle.ViewModel
import com.example.rocket_repo.data.rocketsMock
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class RocketDetailViewModel: ViewModel() {
    private val _rocket = MutableStateFlow(RocketDetailState())
    val rocket: StateFlow<RocketDetailState>
        get() = _rocket

    fun getRocket(id: String) {
        _rocket.value = RocketDetailState(rocketsMock[id.toInt() - 1])
    }
}