package com.veprek.honza.rocketlaunch.repository.mapper

import com.veprek.honza.rocketlaunch.repository.entity.HeightApi
import com.veprek.honza.rocketlaunch.repository.model.Height
import javax.inject.Inject

class HeightApiMapper @Inject constructor() : ApiMapper<HeightApi, Height> {
    override fun mapToDomain(apiEntity: HeightApi): Height {
        return Height(
            feet = apiEntity.feet.toInt(),
            meters = apiEntity.meters.toInt()
        )
    }
}
