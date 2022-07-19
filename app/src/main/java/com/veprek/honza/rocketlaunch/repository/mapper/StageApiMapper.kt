package com.veprek.honza.rocketlaunch.repository.mapper

import com.veprek.honza.rocketlaunch.model.Stage
import com.veprek.honza.rocketlaunch.repository.entity.StageApi
import javax.inject.Inject

class StageApiMapper @Inject constructor() : ApiMapper<StageApi, Stage> {
    override fun mapToDomain(apiEntity: StageApi): Stage {
        return Stage(
            reusable = apiEntity.reusable,
            engines = apiEntity.engines ?: 0,
            fuelAmountTons = apiEntity.fuelAmountTons ?: 0.0,
            burnTimeSec = apiEntity.burnTimeSec ?: 0.0
        )
    }
}
