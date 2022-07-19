package com.veprek.honza.rocketlaunch.repository.mapper

import com.veprek.honza.rocketlaunch.model.Height
import com.veprek.honza.rocketlaunch.repository.entity.HeightApi
import javax.inject.Inject

class HeightApiMapper @Inject constructor() : ApiMapper<HeightApi, Height> {
    override fun mapToDomain(apiEntity: HeightApi): Height {
        return Height(
            feet = apiEntity.feet,
            meters = apiEntity.meters
        )
    }
}
