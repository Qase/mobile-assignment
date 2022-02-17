package com.example.rocketapp.rocket.repository

import com.example.rocketapp.api.dto.RocketItemDto
import retrofit2.http.GET

interface SpaceXRocketApi {

    @GET("rockets")
    suspend fun getAll(): List<RocketItemDto>

}