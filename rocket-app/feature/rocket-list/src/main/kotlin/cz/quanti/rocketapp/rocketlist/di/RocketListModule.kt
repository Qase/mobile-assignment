package cz.quanti.rocketapp.rocketlist.di

import cz.quanti.rocketapp.rocketlist.presentation.RocketListViewModel
import org.koin.androidx.viewmodel.dsl.viewModelOf
import org.koin.dsl.module

val rocketListModule = module {
    viewModelOf(::RocketListViewModel)
}
