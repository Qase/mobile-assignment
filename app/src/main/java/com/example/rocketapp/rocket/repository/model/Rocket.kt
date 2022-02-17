package com.example.rocketapp.rocket.repository.model

import com.example.rocketapp.rocket.repository.model.info.RocketDiameter
import com.example.rocketapp.rocket.repository.model.info.RocketHeight
import com.example.rocketapp.rocket.repository.model.info.RocketMass
import com.example.rocketapp.rocket.repository.model.stages.RocketFirstStage
import com.example.rocketapp.rocket.repository.model.stages.RocketSecondStage
import java.util.*

data class Rocket(
    val id: Int,
    val name: String,
    val firstFlight: Date,
    val description: String,
    val height: RocketHeight,
    val mass: RocketMass,
    val diameter: RocketDiameter,
    val firstStage: RocketFirstStage,
    val secondStage: RocketSecondStage,
    val image: List<String>
)

