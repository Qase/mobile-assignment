package com.veprek.honza.rocketlaunch.repository.mapper

interface ApiMapper<E, D> {
    fun mapToDomain(apiEntity: E): D
}
