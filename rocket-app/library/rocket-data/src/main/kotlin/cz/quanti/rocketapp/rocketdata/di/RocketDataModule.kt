package cz.quanti.rocketapp.rocketdata.di

import cz.quanti.rocketapp.rocketdata.data.SpaceXRocketRepository
import cz.quanti.rocketapp.rocketdata.domain.GetRocketsUseCase
import cz.quanti.rocketapp.rocketdata.domain.RocketRepository
import org.koin.dsl.module

val rocketDataModule = module {
    single<RocketRepository> { SpaceXRocketRepository() }
    single { GetRocketsUseCase(get()) }
}