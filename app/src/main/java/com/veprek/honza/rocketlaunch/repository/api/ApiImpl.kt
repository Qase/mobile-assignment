package com.veprek.honza.rocketlaunch.repository.api

import com.veprek.honza.rocketlaunch.repository.entity.RocketApi
import retrofit2.Retrofit
import retrofit2.create
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class ApiImpl @Inject constructor(
    retrofit: Retrofit
) : Api {
    private val rocketApi = retrofit.create<Api>()

    override suspend fun getAllRockets(): List<RocketApi> {
        return rocketApi.getAllRockets()
    }

    override suspend fun getRocket(rocketId: String): RocketApi {
        return rocketApi.getRocket(rocketId)
    }
}
