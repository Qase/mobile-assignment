package cz.quanti.rocketapp.rocketdata.data

import cz.quanti.rocketapp.rocketdata.model.Rocket
import java.time.LocalDate

fun RocketResponse.toRocket(): Rocket {
    return Rocket(
        this.id,
        this.name,
        LocalDate.parse(this.firstFlight),
    "",
        rocketParameters
    )
}