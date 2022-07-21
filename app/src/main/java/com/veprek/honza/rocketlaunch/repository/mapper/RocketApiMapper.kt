package com.veprek.honza.rocketlaunch.repository.mapper

import com.veprek.honza.rocketlaunch.repository.entity.RocketApi
import com.veprek.honza.rocketlaunch.repository.model.Rocket
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import javax.inject.Inject

class RocketApiMapper @Inject constructor(
    private val heightApiMapper: HeightApiMapper,
    private val massApiMapper: MassApiMapper,
    private val stageApiMapper: StageApiMapper
) : ApiMapper<RocketApi, Rocket> {
    var formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy")

    override fun mapToDomain(apiEntity: RocketApi): Rocket {
        return Rocket(
            id = apiEntity.id,
            active = apiEntity.active,
            name = apiEntity.name.orEmpty(),
            firstFlight = formatDate(apiEntity.firstFlight.orEmpty()),
            description = apiEntity.description.orEmpty(),
            height = heightApiMapper.mapToDomain(apiEntity.height),
            diameter = heightApiMapper.mapToDomain(apiEntity.diameter),
            mass = massApiMapper.mapToDomain(apiEntity.mass),
            firstStage = stageApiMapper.mapToDomain(apiEntity.firstStage),
            secondStage = stageApiMapper.mapToDomain(apiEntity.secondStage),
            images = apiEntity.images
        )
    }

    fun mapToDomainList(rocketList: List<RocketApi>): List<Rocket> {
        return rocketList.map { mapToDomain(it) }
    }

    private fun formatDate(dateString: String): String {
        val date = LocalDate.parse(dateString)
        return date.format(formatter)
    }
}
