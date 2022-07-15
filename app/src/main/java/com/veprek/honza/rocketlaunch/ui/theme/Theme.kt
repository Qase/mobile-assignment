package com.veprek.honza.rocketlaunch.ui.theme // ktlint-disable filename

import androidx.compose.foundation.background
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.MaterialTheme
import androidx.compose.material.darkColors
import androidx.compose.material.lightColors
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier

private val DarkColorPalette = darkColors(
    primary = Orange,
    primaryVariant = Pink,
    secondary = Teal200,
    background = backgroundDark
)

private val LightColorPalette = lightColors(
    primary = Purple500,
    primaryVariant = Purple700,
    secondary = Teal200,
    background = backgroundLight,
    surface = backgroundLight
)

@Composable
fun RocketLaunchTheme(darkTheme: Boolean = isSystemInDarkTheme(), content: @Composable () -> Unit) {
    val colors = if (darkTheme) {
        DarkColorPalette
    } else {
        LightColorPalette
    }

    MaterialTheme(
        colors = colors,
        typography = DMSansTypography,
        shapes = Shapes
    ) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(colors.background)
        ) { content() }
    }
}
