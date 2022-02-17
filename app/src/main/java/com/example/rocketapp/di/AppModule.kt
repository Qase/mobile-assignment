package com.example.rocketapp.di

import com.example.rocketapp.services.RetrofitInstance
import com.example.rocketapp.services.SpaceXRocketApi
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory

@Module
@InstallIn(SingletonComponent::class)
object AppModule {

    @Provides
    fun provideSpaceXRocketApi(): SpaceXRocketApi {
        return RetrofitInstance.retrofit.create(SpaceXRocketApi::class.java)
    }

}