package cz.quanti.rocketapp.rocketdata.system

import cz.quanti.rocketapp.rocketdata.domain.RocketApiService
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

internal object RetrofitBuilder {
    private const val BASE_URL = "https://api.spacexdata.com/v3/"

    private fun getRetrofit(): Retrofit {
        return Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }

    val apiService: RocketApiService = getRetrofit().create(RocketApiService::class.java)
}
