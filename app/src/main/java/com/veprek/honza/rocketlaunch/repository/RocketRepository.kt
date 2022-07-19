package com.veprek.honza.rocketlaunch.repository

import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.repository.entity.ResponseWrapper
import kotlinx.coroutines.flow.Flow

interface RocketRepository {
    suspend fun getAllRockets(): Flow<ResponseWrapper<List<Rocket>?>>
    suspend fun getRocket(id: String): Flow<ResponseWrapper<Rocket?>>
}
