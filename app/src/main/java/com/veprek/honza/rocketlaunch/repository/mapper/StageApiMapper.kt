package com.veprek.honza.rocketlaunch.repository.mapper

import com.veprek.honza.rocketlaunch.repository.entity.StageApi
import com.veprek.honza.rocketlaunch.repository.model.Stage
import javax.inject.Inject

class StageApiMapper @Inject constructor() : ApiMapper<StageApi, Stage> {
    override fun mapToDomain(apiEntity: StageApi): Stage {
        return Stage(
            reusable = apiEntity.reusable,
            engines = apiEntity.engines ?: 0,
            fuelAmountTons = apiEntity.fuelAmountTons?.toInt() ?: 0,
            burnTimeSec = apiEntity.burnTimeSec?.toInt() ?: 0
        )
    }
}
