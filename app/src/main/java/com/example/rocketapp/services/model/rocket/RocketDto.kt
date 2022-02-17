package com.example.rocketapp.services.model.rocket

import com.example.rocketapp.services.model.rocket.info.RocketDiameterDto
import com.example.rocketapp.services.model.rocket.info.RocketHeightDto
import com.example.rocketapp.services.model.rocket.info.RocketMassDto
import com.example.rocketapp.services.model.rocket.stages.RocketFirstStageDto
import com.example.rocketapp.services.model.rocket.stages.RocketSecondStageDto
import java.util.*

data class RocketDto(
    val id: Int,
    val rocketName: String,
    val description: String,
    val firstFlight: Date,
    val height: RocketHeightDto,
    val mass: RocketMassDto,
    val diameter: RocketDiameterDto,
    val firstStage: RocketFirstStageDto,
    val secondStage: RocketSecondStageDto,
    val image: List<String>
)
