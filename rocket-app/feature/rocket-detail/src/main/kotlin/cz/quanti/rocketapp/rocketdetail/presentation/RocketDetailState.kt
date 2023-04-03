package cz.quanti.rocketapp.rocketdetail.presentation

import cz.quanti.rocketapp.rocketdata.model.Rocket

data class RocketDetailState(
    val name: String = "",
    val overview: String = "",
    val height: ParameterState = ParameterState.HeightState(0),
    val diameter: ParameterState = ParameterState.DiameterState(0),
    val mass: ParameterState = ParameterState.MassState(0),
) {
    constructor(rocket: Rocket) : this(
        rocket.name,
        rocket.overview,
        ParameterState.HeightState(rocket.parameters.height),
        ParameterState.DiameterState(rocket.parameters.diameter),
        ParameterState.MassState(rocket.parameters.mass),
    )
}

sealed class ParameterState(
    val value: String,
    val type: ParameterType
) {
    data class HeightState(val height: Int) : ParameterState("${height}m", ParameterType.HEIGHT)
    data class DiameterState(val diameter: Int) : ParameterState(
        "${diameter}m",
        ParameterType.DIAMETER
    )
    data class MassState(val mass: Int) : ParameterState("${mass}t", ParameterType.MASS)
}

enum class ParameterType(val paramName: String) {
    HEIGHT("height"),
    DIAMETER("diameter"),
    MASS("mass")
}
