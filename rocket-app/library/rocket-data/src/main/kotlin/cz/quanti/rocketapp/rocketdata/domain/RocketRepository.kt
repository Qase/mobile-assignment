package cz.quanti.rocketapp.rocketdata.domain

import cz.quanti.rocketapp.rocketdata.model.Rocket

internal interface RocketRepository {
    suspend fun getRockets(): List<Rocket>
    suspend fun getRocketDetail(id: String): Rocket
}
