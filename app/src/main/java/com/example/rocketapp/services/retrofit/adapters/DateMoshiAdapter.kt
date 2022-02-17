package com.example.rocketapp.services.retrofit.adapters

import android.annotation.SuppressLint
import com.squareup.moshi.FromJson

import com.squareup.moshi.ToJson
import java.text.SimpleDateFormat
import java.util.*


class DateMoshiAdapter {

    private val dateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm", Locale.getDefault())

    @ToJson
    fun dateToJson(date: Date): String {
        return dateFormat.format(date)
    }

    @FromJson
    fun dateToJson(s: String): Date {
        return dateFormat.parse(s) ?: throw IllegalAccessException("Could not parse date from $s")
    }
}