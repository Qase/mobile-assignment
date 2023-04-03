package cz.quanti.rocketapp.rocketdata.data

import cz.quanti.rocketapp.rocketdata.domain.RocketApiService
import cz.quanti.rocketapp.rocketdata.domain.RocketRepository
import cz.quanti.rocketapp.rocketdata.model.Rocket

internal class SpaceXRocketRepository(private val api: RocketApiService) : RocketRepository {
    override suspend fun getRockets(): List<Rocket> {
        return api.getRockets().map {
            it.toRocket()
        }
    }

    override suspend fun getRocketDetail(id: String): Rocket {
        TODO("Not yet implemented")
    }
}
