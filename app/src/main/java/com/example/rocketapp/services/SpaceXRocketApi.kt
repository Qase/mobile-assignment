package com.example.rocketapp.services

import com.example.rocketapp.services.dto.RocketListDto
import retrofit2.http.GET

interface SpaceXRocketApi {

    @GET("rockets")
    suspend fun getAll(): RocketListDto

}