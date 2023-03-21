package cz.quanti.rocketapp.rocketdata.data

import cz.quanti.rocketapp.rocketdata.model.Rocket
import cz.quanti.rocketapp.rocketdata.domain.RocketRepository

class RemoteRocketRepository: RocketRepository {
    override fun getRockets(): List<Rocket> {
       return rocketsMock
    }

    override fun getRocketDetail(id: String): Rocket {
        TODO("Not yet implemented")
    }

}