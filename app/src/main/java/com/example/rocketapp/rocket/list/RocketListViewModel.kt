package com.example.rocketapp.rocket.list

import android.app.Application
import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.viewModelScope
import com.example.rocketapp.rocket.repository.SpaceXRocketRepository
import com.example.rocketapp.rocket.repository.model.Rocket
import com.example.rocketapp.tools.BaseViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class RocketListViewModel @Inject constructor(
    private val spaceXRocketRepository: SpaceXRocketRepository
) : BaseViewModel() {

    val rocketsData = spaceXRocketRepository.getRocketData()

    fun loadRockets() {
        viewModelScope.launch {
            Log.d(TAG, "loadRockets request for $spaceXRocketRepository")
            spaceXRocketRepository.loadRocketData()
        }
    }

    companion object {
        private const val TAG = "RocketListViewModel"
    }

}