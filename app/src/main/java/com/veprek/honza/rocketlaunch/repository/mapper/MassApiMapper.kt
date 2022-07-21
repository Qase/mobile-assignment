package com.veprek.honza.rocketlaunch.repository.mapper
import com.veprek.honza.rocketlaunch.repository.entity.MassApi
import com.veprek.honza.rocketlaunch.repository.model.Mass
import javax.inject.Inject

class MassApiMapper @Inject constructor() : ApiMapper<MassApi, Mass> {
    override fun mapToDomain(apiEntity: MassApi): Mass {
        return Mass(
            t = apiEntity.kg / 1000,
            lb = apiEntity.lb
        )
    }
}
