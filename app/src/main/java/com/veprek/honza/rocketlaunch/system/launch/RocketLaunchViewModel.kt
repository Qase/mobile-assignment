package com.veprek.honza.rocketlaunch.system.launch

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.veprek.honza.rocketlaunch.model.RocketState
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import quanti.com.kotlinlog.Log
import javax.inject.Inject

@HiltViewModel
class RocketLaunchViewModel
@Inject constructor() : ViewModel() {
    private val _rocketState = MutableStateFlow(RocketState.WAITING)
    val rocketState: StateFlow<RocketState> get() = _rocketState.asStateFlow()

    private val _isLaunched = MutableStateFlow(true)
    val isLaunched: StateFlow<Boolean> get() = _isLaunched.asStateFlow()

    fun launch() {
        val current = _isLaunched.value
        viewModelScope.launch {
            _rocketState.emit(RocketState.LAUNCHED)
            Log.d("Rocket state: ${_rocketState.value}")
            _isLaunched.emit(!current)
        }
    }

    fun rocketLaunched(): Boolean {
        return !_isLaunched.asStateFlow().value
    }

    fun fail() {
        val current = _isLaunched.value
        viewModelScope.launch {
            _rocketState.emit(RocketState.FAILED)
            Log.d("Rocket state: ${_rocketState.value}")
            _isLaunched.emit(!current)
        }
    }
}
