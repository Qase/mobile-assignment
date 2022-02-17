package com.example.rocketapp.api

import com.example.rocketapp.api.dto.RocketListDto
import retrofit2.http.GET

interface SpaceXRocketApi {

    @GET("rockets")
    suspend fun getAll(): RocketListDto

}