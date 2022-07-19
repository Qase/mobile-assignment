package com.veprek.honza.rocketlaunch.repository.api

import com.veprek.honza.rocketlaunch.repository.entity.RocketApi
import retrofit2.http.GET
import retrofit2.http.Path

interface Api {

    @GET("rockets")
    suspend fun getAllRockets(): List<RocketApi>

    @GET("rockets/{rocketId}")
    suspend fun getRocket(@Path("rocketId") rocketId: String): RocketApi
}
