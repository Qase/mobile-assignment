package com.example.rocket_repo.data

import com.example.rocket_repo.model.Rocket
import com.example.rocket_repo.model.RocketParameters
import java.util.*

val rockets = listOf(
    Rocket(
        "Falcon 1",
        Calendar.getInstance().time,
        "Rocket",
        RocketParameters(
            90,
            40,
            500
        )
    ),
    Rocket(
        "Falcon 9",
        Calendar.getInstance().time,
        "Rocket",
        RocketParameters(
            90,
            40,
            500
        )
    ),
    Rocket(
        "Falcon Heavy",
        Calendar.getInstance().time,
        "Rocket",
        RocketParameters(
            90,
            40,
            500
        )
    ),
    Rocket(
        "Starship",
        Calendar.getInstance().time,
        "Rocket",
        RocketParameters(
            90,
            40,
            500
        )
    )
)