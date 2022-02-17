package com.example.rocketapp.services

import com.example.rocketapp.services.model.rocket.RocketDto
import retrofit2.http.GET

interface SpaceXRocketApi {

    @GET("rockets")
    suspend fun getAll(): List<RocketDto>

}