package com.veprek.honza.rocketlaunch.repository.api

import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import com.veprek.honza.rocketlaunch.repository.entity.RocketApi
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import retrofit2.create
import javax.inject.Inject

class ApiImpl @Inject constructor() : Api {
    private val url = "https://api.spacexdata.com/v4/"
    private val moshi = Moshi.Builder()
        .add(KotlinJsonAdapterFactory())
        .build()

    override suspend fun getAllRockets(): List<RocketApi> {
        val retrofit = Retrofit.Builder()
            .baseUrl(url)
            .addConverterFactory(MoshiConverterFactory.create(moshi))
            .build()

        val rocketApi = retrofit.create<Api>()
        return rocketApi.getAllRockets()
    }

    override suspend fun getRocket(rocketId: String): RocketApi {
        val retrofit = Retrofit.Builder()
            .baseUrl(url)
            .addConverterFactory(MoshiConverterFactory.create(moshi))
            .build()

        val rocketApi = retrofit.create<Api>()
        return rocketApi.getRocket(rocketId)
    }
}
