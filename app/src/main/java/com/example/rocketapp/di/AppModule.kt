package com.example.rocketapp.di

import com.example.rocketapp.api.getRetrofit
import com.example.rocketapp.rocket.repository.SpaceXRocketApi
import com.example.rocketapp.rocket.repository.SpaceXRocketRepository
import com.example.rocketapp.rocket.repository.SpaceXRocketRepositoryImpl
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
        val retrofit = getRetrofit()
        return retrofit.create(SpaceXRocketApi::class.java)
    }

}