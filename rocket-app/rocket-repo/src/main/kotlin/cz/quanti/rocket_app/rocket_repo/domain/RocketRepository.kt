package cz.quanti.rocket_app.rocket_repo.domain

import cz.quanti.rocket_app.rocket_repo.model.Rocket

interface RocketRepository {
    fun getRockets(): List<Rocket>
    fun getRocketDetail(id: String): Rocket
}