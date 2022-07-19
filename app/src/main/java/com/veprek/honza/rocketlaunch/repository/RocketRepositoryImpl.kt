package com.veprek.honza.rocketlaunch.repository

import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.model.State
import com.veprek.honza.rocketlaunch.repository.api.ApiImpl
import com.veprek.honza.rocketlaunch.repository.entity.ResponseWrapper
import com.veprek.honza.rocketlaunch.repository.mapper.RocketApiMapper
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import quanti.com.kotlinlog.Log
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class RocketRepositoryImpl
@Inject constructor(
    private val rocketRepository: ApiImpl,
    private val mapper: RocketApiMapper
) : RocketRepository {
    override suspend fun getAllRockets(): Flow<ResponseWrapper<List<Rocket>?>> = flow {
        emit(ResponseWrapper(State.LOADING, null))
        val rockets = rocketRepository.getAllRockets()
        // Save to db
        emit(ResponseWrapper(State.SUCCESS, mapper.mapToDomainList(rockets)))
        Log.d(mapper.mapToDomainList(rockets).toString())
    }

    override suspend fun getRocket(id: String): Flow<ResponseWrapper<Rocket?>> = flow {
        emit(ResponseWrapper(State.LOADING, null))
        val rocket = rocketRepository.getRocket(id)
        // Save to db
        emit(ResponseWrapper(State.SUCCESS, mapper.mapToDomain(rocket)))
    }
}
