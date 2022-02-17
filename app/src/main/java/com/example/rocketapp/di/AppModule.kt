package com.example.rocketapp.di

import com.example.rocketapp.api.getRetrofit
import com.example.rocketapp.api.SpaceXRocketApi
import com.example.rocketapp.rocket.repository.SpaceXRocketRepository
import com.example.rocketapp.rocket.repository.ProdSpaceXRocketRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object AppModule {

    @Provides
    @Singleton
    fun provideSpaceXRocketRepository(api: SpaceXRocketApi): SpaceXRocketRepository {
        return ProdSpaceXRocketRepository(api)
    }

    @Provides
    fun provideSpaceXRocketApi(): SpaceXRocketApi {
        val retrofit = getRetrofit()
        return retrofit.create(SpaceXRocketApi::class.java)
    }

}