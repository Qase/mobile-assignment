package com.veprek.honza.rocketlaunch.data.module

import android.content.Context
import androidx.room.Room
import com.veprek.honza.rocketlaunch.data.AppDatabase
import com.veprek.honza.rocketlaunch.data.rocket.RocketDao
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@InstallIn(SingletonComponent::class)
@Module
class DatabaseModule {
    @Provides
    fun provideRocketDao(appDatabase: AppDatabase): RocketDao {
        return appDatabase.rocketDao()
    }

    @Provides
    @Singleton
    fun provideAppDatabase(@ApplicationContext context: Context): AppDatabase {
        return Room.databaseBuilder(
            context,
            AppDatabase::class.java,
            "rocket_db"
        ).build()
    }
}
