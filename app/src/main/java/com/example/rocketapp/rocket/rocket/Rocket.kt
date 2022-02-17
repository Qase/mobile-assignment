package com.example.rocketapp.rocket.rocket

import com.example.rocketapp.rocket.rocket.info.RocketDiameter
import com.example.rocketapp.rocket.rocket.info.RocketHeight
import com.example.rocketapp.rocket.rocket.info.RocketMass
import com.example.rocketapp.rocket.rocket.stages.RocketFirstStage
import com.example.rocketapp.rocket.rocket.stages.RocketSecondStage

data class Rocket(
    val id: Int,
    val description: String,
    val height: RocketHeight,
    val mass: RocketMass,
    val diameter: RocketDiameter,
    val firstStage: RocketFirstStage,
    val secondStage: RocketSecondStage,
    val image: List<String>
)

