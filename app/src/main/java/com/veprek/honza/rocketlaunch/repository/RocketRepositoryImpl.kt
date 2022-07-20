package com.veprek.honza.rocketlaunch.repository

import com.veprek.honza.rocketlaunch.data.rockets.RocketDao
import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.model.State
import com.veprek.honza.rocketlaunch.repository.api.ApiImpl
import com.veprek.honza.rocketlaunch.repository.entity.ResponseWrapper
import com.veprek.honza.rocketlaunch.repository.mapper.RocketApiMapper
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import quanti.com.kotlinlog.Log
import java.net.UnknownHostException
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class RocketRepositoryImpl
@Inject constructor(
    private val rocketRepository: ApiImpl,
    private val rocketDao: RocketDao,
    private val rocketMapper: RocketApiMapper
) : RocketRepository {
    override suspend fun getAllRockets(): Flow<ResponseWrapper<List<Rocket>?>> = flow {
        emit(ResponseWrapper(State.LOADING, null))

        try {
            val rockets = rocketRepository.getAllRockets()
            rocketDao.insertRockets(rocketMapper.mapToDomainList(rockets))
            emit(ResponseWrapper(State.SUCCESS, rocketMapper.mapToDomainList(rockets)))
        } catch (e: Exception) {
            if (e is UnknownHostException) {
                val rockets = rocketDao.getAll()
                if (rockets.isEmpty()) {
                    Log.d("Empty DB")
                    emit(ResponseWrapper(State.NO_INTERNET, null))
                } else {
                    Log.d("From DB")
                    emit(ResponseWrapper(State.SUCCESS, rockets))
                }
            } else {
                throw e
            }
        }
    }

    override suspend fun getRocket(id: String): Flow<ResponseWrapper<Rocket?>> = flow {
        emit(ResponseWrapper(State.LOADING, null))
        try {
            val rocket = rocketRepository.getRocket(id)
//            rocketDao.insertOrUpdateRocket(rocketMapper.mapToDomain(rocket))
            emit(ResponseWrapper(State.SUCCESS, rocketMapper.mapToDomain(rocket)))
        } catch (e: Exception) {
            if (e is UnknownHostException) {
                val rocket = rocketDao.findById(id)
                if (rocket == null) {
                    Log.d("Empty DB")
                    emit(ResponseWrapper(State.NO_INTERNET, null))
                } else {
                    Log.d("From DB")
                    emit(ResponseWrapper(State.SUCCESS, rocket))
                }
            } else {
                throw e
            }
        }
    }
}
