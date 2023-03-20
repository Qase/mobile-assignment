package cz.quanti.rocket_app.rocket_repo.data

import cz.quanti.rocket_app.rocket_repo.model.Rocket
import cz.quanti.rocket_app.rocket_repo.domain.RocketRepository

class RemoteRocketRepository: RocketRepository {
    override fun getRockets(): List<Rocket> {
       return rocketsMock
    }

    override fun getRocketDetail(id: String): Rocket {
        TODO("Not yet implemented")
    }

}