package cz.quanti.rocketapp.rocketdata.domain

import cz.quanti.rocketapp.rocketdata.data.SpaceXRocketRepository
import cz.quanti.rocketapp.rocketdata.model.Rocket

suspend fun getRocketsUseCase(): List<Rocket> {
    val repo: RocketRepository = SpaceXRocketRepository()

    return repo.getRockets()
}