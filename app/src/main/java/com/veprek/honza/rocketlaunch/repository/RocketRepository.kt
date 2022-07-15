package com.veprek.honza.rocketlaunch.repository

import com.veprek.honza.rocketlaunch.model.Rocket
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.StateFlow

interface RocketRepository {
    val rockets: Flow<List<Rocket>?>

    suspend fun getRockets(): StateFlow<List<Rocket>?>
    suspend fun getRocket(id: String): Flow<ResponseWrapper<out Rocket?>>
}
