package cz.quanti.rocketapp.rocketdata.data

import cz.quanti.rocketapp.rocketdata.model.Rocket

fun RocketResponse.toRocket(): Rocket {
    return Rocket(
        this.id,
        this.name,
        this.firstFlight,
    "",
        rocketParameters
    )
}