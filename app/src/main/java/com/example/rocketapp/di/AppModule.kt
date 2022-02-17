package com.example.rocketapp.di

import com.example.rocketapp.api.RetrofitInstance
import com.example.rocketapp.api.SpaceXRocketApi
import com.example.rocketapp.api.SpaceXRocketRepository
import com.example.rocketapp.api.SpaceXRocketRepositoryImpl
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
object AppModule {

    @Provides
    fun provideSpaceXRocketRepository(api: SpaceXRocketApi): SpaceXRocketRepository {
        return SpaceXRocketRepositoryImpl(api)
    }

    @Provides
    fun provideSpaceXRocketApi(): SpaceXRocketApi {
        val retrofit = RetrofitInstance.getRetrofit()
        return retrofit.create(SpaceXRocketApi::class.java)
    }

}