package com.example.rocketapp

import android.app.Application
import dagger.hilt.android.HiltAndroidApp

@HiltAndroidApp
class RocketApp: Application() {

    override fun onCreate() {
        super.onCreate()
    }

}