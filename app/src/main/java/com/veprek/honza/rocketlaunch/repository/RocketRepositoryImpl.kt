package com.veprek.honza.rocketlaunch.repository

import com.veprek.honza.rocketlaunch.model.Rocket
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class RocketRepositoryImpl : RocketRepository {
    private val _rockets = MutableStateFlow<List<Rocket>?>(null)
    override val rockets: Flow<List<Rocket>?> get() = _rockets

    override suspend fun getRockets(): StateFlow<List<Rocket>?> {
//        return if (_rockets.value == null)
//            downloadRockets()
        TODO("Not yet implemented")
    }

    override suspend fun getRocket(id: String): Flow<ResponseWrapper<out Rocket?>> {
        TODO("Not yet implemented")
    }
}
