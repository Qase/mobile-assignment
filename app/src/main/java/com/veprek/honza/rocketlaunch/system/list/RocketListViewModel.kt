package com.veprek.honza.rocketlaunch.system.list

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.model.State
import com.veprek.honza.rocketlaunch.repository.RocketRepositoryImpl
import com.veprek.honza.rocketlaunch.repository.entity.ResponseWrapper
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class RocketListViewModel
@Inject constructor(private val rocketRepository: RocketRepositoryImpl) : ViewModel() {
    private val _rockets = MutableStateFlow(ResponseWrapper<List<Rocket>?>(State.LOADING, null))
    val rockets: StateFlow<ResponseWrapper<List<Rocket>?>> get() = _rockets

    init {
        getRockets()
    }

    private fun getRockets() {
        viewModelScope.launch {
            rocketRepository.getAllRockets().collect { response ->
                _rockets.value = response
            }
        }
    }
}
