package com.example.rocketapp.services

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.rocketapp.model.rocket.Rocket
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject


class SpaceXRocketRepository @Inject constructor(
    private val api: SpaceXRocketApi
) {

    private val rocketsData = MutableLiveData<List<Rocket>>()

    fun getRocketData(): LiveData<List<Rocket>> {
        return rocketsData
    }

    suspend fun loadRocketData() {
        withContext(Dispatchers.IO) {
            val data = api.getAll().toRocketList()
            rocketsData.postValue(data)
        }
    }

}