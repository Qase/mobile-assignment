package com.example.rocketapp.rocket.list

import android.app.Application
import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.viewModelScope
import com.example.rocketapp.rocket.list.adapter.RocketItem
import com.example.rocketapp.rocket.repository.SpaceXRocketRepository
import com.example.rocketapp.rocket.repository.model.Rocket
import com.example.rocketapp.tools.BaseViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class RocketListViewModel @Inject constructor(
    private val spaceXRocketRepository: SpaceXRocketRepository
) : BaseViewModel() {

    val rocketItemsData by lazy { getRocketItemsDataFromRepository() }

    init {
        loadRockets()
    }

    fun loadRockets() {
        viewModelScope.launch {
            Log.d(TAG, "loadRockets request for $spaceXRocketRepository")
            spaceXRocketRepository.loadRocketData()
        }
    }

    private fun getRocketItemsDataFromRepository(): Flow<List<RocketItem>> {
        return spaceXRocketRepository
            .getRocketData().map { result ->
                val rockets = result?.getOrNull() ?: emptyList()
                rockets.map {
                    RocketItem(it.id, it.name, it.firstFlight)
                }
            }
    }

    companion object {
        private const val TAG = "RocketListViewModel"
    }

}