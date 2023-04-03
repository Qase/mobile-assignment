package cz.quanti.rocketapp.rocketdetail.presentation

import androidx.lifecycle.ViewModel
import cz.quanti.rocketapp.rocketdata.data.rocketsMock
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class RocketDetailViewModel : ViewModel() {
    private val _rocket = MutableStateFlow(RocketDetailState())
    val rocket: StateFlow<RocketDetailState>
        get() = _rocket

    fun getRocket(id: String) {
        _rocket.value = RocketDetailState(rocketsMock[id.toInt() - 1])
    }
}
