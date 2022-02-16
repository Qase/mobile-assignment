package com.example.rocketapp.services

import com.example.rocketapp.services.model.rocket.RocketDto
import retrofit2.http.GET

interface SpaceXRocketRepository {

    @GET("rockets")
    suspend fun getAll(): List<RocketDto>

}