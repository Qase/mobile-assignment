package com.example.rocketapp.api

import com.squareup.moshi.FromJson
import com.squareup.moshi.Moshi
import com.squareup.moshi.ToJson
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import java.text.SimpleDateFormat
import java.util.*
import java.util.concurrent.TimeUnit


class DateAdapter {

    private val dateFormat = SimpleDateFormat("yyyy-MM-dd", Locale.getDefault())

    @ToJson
    fun dateToJson(d: Date): String {
        return dateFormat.format(d)
    }

    @FromJson
    fun dateToJson(s: String): Date {
        return dateFormat.parse(s) ?: throw IllegalArgumentException("Could not parse date $s")
    }

}

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

private fun getRetrofit(okHttpClient: OkHttpClient, retrofitBuilder: Retrofit.Builder): Retrofit {
    return retrofitBuilder
        .client(okHttpClient)
        .build()
}

private fun getOkHttpClientBuilder(): OkHttpClient.Builder {
    return OkHttpClient().newBuilder()
        .readTimeout(20, TimeUnit.SECONDS)
        .writeTimeout(20, TimeUnit.SECONDS)
        .retryOnConnectionFailure(true)
}

private fun getRetrofitBuilder(baseUrl: String): Retrofit.Builder {
    val moshi = Moshi.Builder()
        .add(DateAdapter())
        .build()
    return Retrofit.Builder()
        .baseUrl(baseUrl)
        .addConverterFactory(
            MoshiConverterFactory.create(moshi)
        )
}