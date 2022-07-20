package com.veprek.honza.rocketlaunch.data

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import com.veprek.honza.rocketlaunch.data.rockets.RocketDao
import com.veprek.honza.rocketlaunch.model.Rocket

@TypeConverters(Converters::class)
@Database(entities = [Rocket::class], version = 1)
abstract class AppDatabase : RoomDatabase() {
    abstract fun rocketDao(): RocketDao
}
