package com.example.rocketapp.services

import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory

object RetrofitInstance {

    private val retrofit by lazy {
        Retrofit.Builder()
            .baseUrl("https://api.spacexdata.com/v3/")
            .addConverterFactory(
                MoshiConverterFactory.create()
            ).build()
    }

    val spaceXRocketRepository: SpaceXRocketRepository by lazy {
        retrofit.create(SpaceXRocketRepository::class.java)
    }

}