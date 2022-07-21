package com.veprek.honza.rocketlaunch.repository.db

import androidx.room.TypeConverter
import com.squareup.moshi.JsonAdapter
import com.squareup.moshi.Moshi
import com.squareup.moshi.Types
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import com.veprek.honza.rocketlaunch.repository.model.Height
import com.veprek.honza.rocketlaunch.repository.model.Mass
import com.veprek.honza.rocketlaunch.repository.model.Stage
import java.lang.reflect.Type

class Converters {
    @TypeConverter
    fun stageFromString(value: String): Stage? {
        val moshi: Moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
        val adapter: JsonAdapter<Stage> = moshi.adapter(Stage::class.java)

        return adapter.fromJson(value)
    }

    @TypeConverter
    fun stageToString(value: Stage?): String {
        val moshi: Moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
        val adapter: JsonAdapter<Stage> = moshi.adapter(Stage::class.java)

        return adapter.toJson(value)
    }

    @TypeConverter
    fun massFromString(value: String): Mass? {
        val moshi: Moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
        val adapter: JsonAdapter<Mass> = moshi.adapter(Mass::class.java)

        return adapter.fromJson(value)
    }

    @TypeConverter
    fun massToString(value: Mass?): String {
        val moshi: Moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
        val adapter: JsonAdapter<Mass> = moshi.adapter(Mass::class.java)

        return adapter.toJson(value)
    }

    @TypeConverter
    fun heightFromString(value: String): Height? {
        val moshi: Moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
        val adapter: JsonAdapter<Height> = moshi.adapter(Height::class.java)

        return adapter.fromJson(value)
    }

    @TypeConverter
    fun heightToString(value: Height?): String {
        val moshi: Moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
        val adapter: JsonAdapter<Height> = moshi.adapter(Height::class.java)

        return adapter.toJson(value)
    }

    @TypeConverter
    fun listFromString(value: String): List<String>? {
        val moshi: Moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
        val type: Type = Types.newParameterizedType(List::class.java, String::class.java)
        val adapter: JsonAdapter<List<String>> = moshi.adapter(type)

        return adapter.fromJson(value)
    }

    @TypeConverter
    fun listToString(value: List<String>?): String {
        val moshi: Moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
        val type: Type = Types.newParameterizedType(List::class.java, String::class.java)
        val adapter: JsonAdapter<List<String>> = moshi.adapter(type)

        return adapter.toJson(value)
    }
}
