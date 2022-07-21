package com.veprek.honza.rocketlaunch.data.rocket

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.veprek.honza.rocketlaunch.model.Rocket

@Dao
interface RocketDao {
    @Query("SELECT * FROM rocket")
    suspend fun getAll(): List<Rocket>

    @Query("SELECT * FROM rocket WHERE id = :id")
    suspend fun findById(id: String): Rocket?

    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insert(rocket: Rocket)

    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun insertRockets(rockets: List<Rocket>)
}
