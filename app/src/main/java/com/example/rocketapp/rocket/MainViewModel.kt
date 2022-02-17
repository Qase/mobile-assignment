package com.example.rocketapp.rocket

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import com.example.rocketapp.rocket.repository.ProdSpaceXRocketRepository
import com.example.rocketapp.rocket.repository.model.Rocket
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

//TODO will be moved to another package
@HiltViewModel
class MainViewModel @Inject constructor(
    private val spaceXRocketRepository: ProdSpaceXRocketRepository
): ViewModel() {

    val rocketsData: LiveData<List<Rocket>> = spaceXRocketRepository.getRocketData()

    suspend fun loadRockets() {
        spaceXRocketRepository.loadRocketData()
    }
}