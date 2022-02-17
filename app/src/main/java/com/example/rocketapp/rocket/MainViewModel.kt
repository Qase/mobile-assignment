package com.example.rocketapp.rocket

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import com.example.rocketapp.api.SpaceXRocketRepository
import com.example.rocketapp.rocket.model.Rocket
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

@HiltViewModel
class MainViewModel @Inject constructor(
    private val spaceXRocketRepository: SpaceXRocketRepository
): ViewModel() {

    val rocketsData: LiveData<List<Rocket>> = spaceXRocketRepository.getRocketData()

    suspend fun loadRockets() {
        spaceXRocketRepository.loadRocketData()
    }
}