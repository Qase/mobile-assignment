package cz.quanti.rocketapp.rocketdata.domain

import cz.quanti.rocketapp.rocketdata.data.RocketResponse
import retrofit2.http.GET

interface RocketApiService {

    @GET("rockets")
    suspend fun getRockets(): List<RocketResponse>
}