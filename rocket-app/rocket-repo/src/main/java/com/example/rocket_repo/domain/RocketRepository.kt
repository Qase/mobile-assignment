package com.example.rocket_repo.domain

import com.example.rocket_repo.model.Rocket

interface RocketRepository {
    fun getRockets(): List<Rocket>
}