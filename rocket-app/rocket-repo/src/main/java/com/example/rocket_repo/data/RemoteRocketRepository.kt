package com.example.rocket_repo.data

import com.example.rocket_repo.model.Rocket
import com.example.rocket_repo.domain.RocketRepository

class RemoteRocketRepository: RocketRepository {
    override fun getRockets(): List<Rocket> {
       return rocketsMock
    }

    override fun getRocketDetail(id: String): Rocket {
        TODO("Not yet implemented")
    }

}