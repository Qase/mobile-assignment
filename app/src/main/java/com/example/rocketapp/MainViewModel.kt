package com.example.rocketapp

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import com.example.rocketapp.services.SpaceXRocketService
import com.example.rocketapp.services.model.rocket.RocketDto
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import javax.inject.Inject
import kotlin.coroutines.CoroutineContext

@HiltViewModel
class MainViewModel @Inject constructor(
    private val spaceXRocketService: SpaceXRocketService
): ViewModel() {

    val rocketsData: LiveData<List<RocketDto>> = spaceXRocketService.getRocketData()

    suspend fun loadRockets() {
        spaceXRocketService.loadRocketData()
    }
}