package com.example.rocketapp.rocket.list

import android.app.Application
import androidx.lifecycle.LiveData
import com.example.rocketapp.rocket.repository.SpaceXRocketRepositoryImpl
import com.example.rocketapp.rocket.repository.model.Rocket
import com.example.rocketapp.tools.BaseViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject

@HiltViewModel
class RocketListViewModel @Inject constructor(
    @ApplicationContext application: Application,
    private val spaceXRocketRepository: SpaceXRocketRepositoryImpl
) : BaseViewModel(application) {

    val rocketsData: LiveData<List<Rocket>> = spaceXRocketRepository.getRocketData()

    suspend fun loadRockets() {
        spaceXRocketRepository.loadRocketData()
    }

}