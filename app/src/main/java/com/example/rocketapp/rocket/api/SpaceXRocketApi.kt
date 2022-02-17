package com.example.rocketapp.rocket.api

import com.example.rocketapp.rocket.api.dto.RocketListDto
import retrofit2.http.GET

interface SpaceXRocketApi {

    @GET("rockets")
    suspend fun getAll(): RocketListDto

}