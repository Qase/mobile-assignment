package cz.quanti.rocketapp.app.di

import cz.quanti.rocketapp.rocketdata.di.rocketDataModule
import cz.quanti.rocketapp.rocketlist.di.rocketListModule
import org.koin.core.context.startKoin

fun setupKoin() {
    startKoin {
        modules(listOf(rocketListModule, rocketDataModule))
    }
}
