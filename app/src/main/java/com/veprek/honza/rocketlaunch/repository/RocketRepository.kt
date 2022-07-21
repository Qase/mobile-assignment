package com.veprek.honza.rocketlaunch.repository

import com.veprek.honza.rocketlaunch.repository.entity.ResponseWrapper
import com.veprek.honza.rocketlaunch.repository.model.Rocket
import kotlinx.coroutines.flow.Flow

interface RocketRepository {
    suspend fun getAllRockets(): Flow<ResponseWrapper<List<Rocket>?>>
    suspend fun getRocket(id: String): Flow<ResponseWrapper<Rocket?>>
}
