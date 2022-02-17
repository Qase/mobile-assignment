package com.example.rocketapp.di

import com.example.rocketapp.services.retrofit.RetrofitInstance
import com.example.rocketapp.services.SpaceXRocketRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
object AppModule {

    @Provides
    fun provideSpaceXRocketRepository(): SpaceXRocketRepository {
        return RetrofitInstance.spaceXRocketRepository
    }

}