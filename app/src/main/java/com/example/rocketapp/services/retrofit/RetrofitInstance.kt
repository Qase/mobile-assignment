package com.example.rocketapp.services.retrofit

import com.example.rocketapp.services.SpaceXRocketRepository
import com.example.rocketapp.services.retrofit.adapters.DateMoshiAdapter
import com.squareup.moshi.Moshi
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import java.util.*


object RetrofitInstance {

    private val retrofit by lazy {
        val moshi = Moshi.Builder()
            .add(DateMoshiAdapter())
            .build()
        Retrofit.Builder()
            .baseUrl("https://api.spacexdata.com/v3/")
            .addConverterFactory(
                MoshiConverterFactory.create(moshi)
            ).build()
    }

    val spaceXRocketRepository: SpaceXRocketRepository by lazy {
        retrofit.create(SpaceXRocketRepository::class.java)
    }

}