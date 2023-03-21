package cz.quanti.rocketapp.rocketdata.domain

import cz.quanti.rocketapp.rocketdata.model.Rocket

interface RocketRepository {
    fun getRockets(): List<Rocket>
    fun getRocketDetail(id: String): Rocket
}