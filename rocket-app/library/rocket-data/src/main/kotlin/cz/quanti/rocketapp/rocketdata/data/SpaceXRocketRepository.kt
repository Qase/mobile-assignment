package cz.quanti.rocketapp.rocketdata.data

import cz.quanti.rocketapp.rocketdata.model.Rocket
import cz.quanti.rocketapp.rocketdata.domain.RocketRepository
import cz.quanti.rocketapp.rocketdata.infrastructure.RetrofitBuilder

class SpaceXRocketRepository: RocketRepository {

    private val api = RetrofitBuilder.apiService

    override suspend fun getRockets(): List<Rocket> {
       return api.getRockets().map {
           Rocket(it)
       }
    }

    override suspend fun getRocketDetail(id: String): Rocket {
        TODO("Not yet implemented")
    }

}