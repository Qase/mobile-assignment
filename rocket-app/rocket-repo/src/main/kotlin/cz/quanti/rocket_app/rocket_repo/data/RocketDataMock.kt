package cz.quanti.rocket_app.rocket_repo.data

import cz.quanti.rocket_app.rocket_repo.model.Rocket
import cz.quanti.rocket_app.rocket_repo.model.RocketParameters
import java.time.LocalDate

val rocketParameters = RocketParameters(
    90,
    40,
    500
)

val rocketsMock = listOf(
    Rocket(
        "1",
        "Falcon 1",
        LocalDate.now(),
        "Rocket",
        rocketParameters
    ),
    Rocket(
        "2",
        "Falcon 9",
        LocalDate.now(),
        "Rocket",
        rocketParameters
    ),
    Rocket(
        "3",
        "Falcon Heavy",
        LocalDate.now(),
        "Rocket",
        rocketParameters
    ),
    Rocket(
        "4",
        "Starship",
        LocalDate.now(),
        "Rocket",
        rocketParameters
    )
)