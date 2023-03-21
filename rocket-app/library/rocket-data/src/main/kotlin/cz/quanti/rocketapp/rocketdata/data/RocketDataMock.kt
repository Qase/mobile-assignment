package cz.quanti.rocketapp.rocketdata.data

import cz.quanti.rocketapp.rocketdata.model.Rocket
import cz.quanti.rocketapp.rocketdata.model.RocketParameters

val rocketParameters = RocketParameters(
    90,
    40,
    500
)

val rocketsMock = listOf(
    Rocket(
        1,
        "Falcon 1",
        "",
        "Rocket",
        rocketParameters
    ),
    Rocket(
        2,
        "Falcon 9",
        "",
        "Rocket",
        rocketParameters
    ),
    Rocket(
        3,
        "Falcon Heavy",
        "",
        "Rocket",
        rocketParameters
    ),
    Rocket(
        4,
        "Starship",
        "",
        "Rocket",
        rocketParameters
    )
)