package com.example.rocketapp.rocket.detail

import android.app.Application
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.viewModelScope
import com.example.rocketapp.rocket.repository.SpaceXRocketRepository
import com.example.rocketapp.rocket.repository.model.Rocket
import com.example.rocketapp.tools.BaseViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class RocketDetailViewModel @Inject constructor(
    private val spaceXRocketRepository: SpaceXRocketRepository
) : BaseViewModel() {

    private val _rocketData = MutableStateFlow<Rocket?>(null)
    val rocketData: StateFlow<Rocket?> = _rocketData

    fun loadDetail(rocketId: Int) {
        viewModelScope.launch {
            val rocket = spaceXRocketRepository.getRocketById(rocketId)
            _rocketData.value = rocket
        }
    }

}