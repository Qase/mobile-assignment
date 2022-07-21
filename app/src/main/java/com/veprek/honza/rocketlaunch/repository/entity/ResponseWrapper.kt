package com.veprek.honza.rocketlaunch.repository.entity

import com.veprek.honza.rocketlaunch.repository.model.State

data class ResponseWrapper<T>(
    val state: State,
    val data: T
)
