package com.example.rocketapp.api

import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import java.util.concurrent.TimeUnit

object RetrofitInstance {

    fun getRetrofit(): Retrofit {
        val okHttp = getOkHttpClientBuilder()
            .addInterceptor { chain ->
                val originalRequest = chain.request()
                val requestWithHeaders = originalRequest.newBuilder()
                    .header("Accept-Language", "cs")
                    .build()
                chain.proceed(requestWithHeaders)
            }
            .build()
        val retrofitBuilder = getRetrofitBuilder("https://api.spacexdata.com/v3/")
        return getRetrofit(okHttp, retrofitBuilder)
    }

    private fun getOkHttpClientBuilder(): OkHttpClient.Builder {
        return OkHttpClient().newBuilder()
            .readTimeout(20, TimeUnit.SECONDS)
            .writeTimeout(20, TimeUnit.SECONDS)
            .retryOnConnectionFailure(true)
    }

    private fun getRetrofitBuilder(baseUrl: String): Retrofit.Builder {
        return Retrofit.Builder()
            .baseUrl(baseUrl)
            .addConverterFactory(MoshiConverterFactory.create())
    }

    private fun getRetrofit(okHttpClient: OkHttpClient, retrofitBuilder: Retrofit.Builder): Retrofit {
        return retrofitBuilder
            .client(okHttpClient)
            .build()
    }

}