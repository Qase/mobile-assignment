package com.example.rocketapp.services

import com.example.rocketapp.model.rocket.Rocket
import com.example.rocketapp.model.rocket.info.RocketDiameter
import com.example.rocketapp.model.rocket.info.RocketHeight
import com.example.rocketapp.model.rocket.info.RocketMass
import com.example.rocketapp.model.rocket.stages.RocketFirstStage
import com.example.rocketapp.model.rocket.stages.RocketSecondStage
import com.example.rocketapp.services.dto.FirstStageDto
import com.example.rocketapp.services.dto.RocketItemDto
import com.example.rocketapp.services.dto.RocketListDto
import com.example.rocketapp.services.dto.SecondStageDto

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