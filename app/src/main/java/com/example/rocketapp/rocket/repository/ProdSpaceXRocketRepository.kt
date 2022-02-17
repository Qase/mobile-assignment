package com.example.rocketapp.rocket.repository

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.rocketapp.api.SpaceXRocketApi
import com.example.rocketapp.rocket.repository.model.Rocket
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject


interface SpaceXRocketRepository {
    fun getRocketData(): LiveData<List<Rocket>>
    suspend fun loadRocketData()
}

class SpaceXRocketRepositoryImpl @Inject constructor(
    private val api: SpaceXRocketApi
) : SpaceXRocketRepository {

    private val rocketsData = MutableLiveData<List<Rocket>>()

    override fun getRocketData(): LiveData<List<Rocket>> {
        return rocketsData
    }

    override suspend fun loadRocketData() {
        withContext(Dispatchers.IO) {
            val data = api.getAll().toRocketList()
            rocketsData.postValue(data)
        }
    }
}