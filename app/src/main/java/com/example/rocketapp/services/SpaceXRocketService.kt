package com.example.rocketapp.services

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.rocketapp.services.model.rocket.RocketDto
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject


class SpaceXRocketService @Inject constructor(
    val repository: SpaceXRocketRepository
) {

    private val rocketsData = MutableLiveData<List<RocketDto>>()

    fun getRocketData(): LiveData<List<RocketDto>> {
        return rocketsData
    }

    suspend fun loadRocketData() {
        withContext(Dispatchers.IO) {
            val data = repository.getAll()
            rocketsData.postValue(data)
        }
    }

}