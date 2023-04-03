package cz.quanti.rocketapp.app.system

import android.app.Application
import cz.quanti.rocketapp.app.di.setupKoin

class App : Application() {
    override fun onCreate() {
        super.onCreate()
        setupKoin()
    }
}
