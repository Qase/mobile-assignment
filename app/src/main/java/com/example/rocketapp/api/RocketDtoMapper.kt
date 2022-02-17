package com.example.rocketapp.api

import com.example.rocketapp.rocket.rocket.Rocket
import com.example.rocketapp.rocket.rocket.info.RocketDiameter
import com.example.rocketapp.rocket.rocket.info.RocketHeight
import com.example.rocketapp.rocket.rocket.info.RocketMass
import com.example.rocketapp.rocket.rocket.stages.RocketFirstStage
import com.example.rocketapp.rocket.rocket.stages.RocketSecondStage
import com.example.rocketapp.api.dto.FirstStageDto
import com.example.rocketapp.api.dto.RocketItemDto
import com.example.rocketapp.api.dto.RocketListDto
import com.example.rocketapp.api.dto.SecondStageDto

fun RocketListDto.toRocketList() = map {
    it.toRocket()
}

fun RocketItemDto.toRocket() = Rocket(
    id,
    description,
    RocketHeight(
        meters = height.meters,
        feet = height.feet
    ),
    RocketMass(
        kg = mass.kg,
        lb = mass.lb
    ),
    RocketDiameter(
        feet = diameter.feet,
        meters = diameter.meters
    ),
    firstStage.toRocketStage(),
    secondStage.toRocketStage(),
    flickrImages
)

private fun FirstStageDto.toRocketStage() = RocketFirstStage(
    reusable,
    engines,
    fuelAmountTons,
    burnTimeSec
)

private fun SecondStageDto.toRocketStage() = RocketSecondStage(
    reusable,
    engines,
    fuelAmountTons,
    burnTimeSec
)