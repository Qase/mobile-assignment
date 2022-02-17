package com.example.rocketapp.rocket.repository

import com.example.rocketapp.api.SpaceXRocketApi
import com.example.rocketapp.rocket.repository.model.Rocket
import com.example.rocketapp.tools.Success
import com.example.rocketapp.tools.Try
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton


interface SpaceXRocketRepository {
    fun getRocketData(): StateFlow<Result<List<Rocket>>?>
    suspend fun getRocketById(rocketId: Int): Rocket?
    suspend fun loadRocketData()
}

class ProdSpaceXRocketRepository(
    private val api: SpaceXRocketApi
) : SpaceXRocketRepository {

    private val rocketsData = MutableStateFlow<Result<List<Rocket>>?>(null)

    override fun getRocketData(): StateFlow<Result<List<Rocket>>?> {
        return rocketsData
    }

    override suspend fun loadRocketData() {
        withContext(Dispatchers.IO) {
            val test = api.getAll().toRocketList()
            val result = Try.invokeCoroutines {
                api.getAll().toRocketList()
            }.toResult()
            rocketsData.value = result
        }
    }

    override suspend fun getRocketById(rocketId: Int): Rocket? {
        return withContext(Dispatchers.Default) {
            val rocketResult = rocketsData.value
            rocketResult
                ?.getOrNull()
                ?.find { it.id == rocketId }
        }
    }
}