package com.veprek.honza.rocketlaunch

import android.app.Application
import dagger.hilt.android.HiltAndroidApp
import quanti.com.kotlinlog.Log
import quanti.com.kotlinlog.android.AndroidLogger
import quanti.com.kotlinlog.base.LogLevel
import quanti.com.kotlinlog.base.LoggerBundle

@HiltAndroidApp
class App : Application() {

    override fun onCreate() {
        super.onCreate()
        Log.initialise(this)

        val androidBundle = LoggerBundle(LogLevel.DEBUG)
        Log.addLogger(AndroidLogger(androidBundle))
    }
}
