package cz.quanti.rocketapp.design.system

import androidx.compose.runtime.Immutable
import androidx.compose.ui.graphics.Color

@Immutable
data class RocketAppColorPalette(
    val primary: Color,
    val secondary: Color,
    val textPrimary: Color,
    val textSecondary: Color,
    val background: Color,
    val componentBackground: Color,
)

val rocketAppColorPalette = RocketAppColorPalette(
    primary = pink,
    secondary = grey,
    textPrimary = black,
    textSecondary = grey,
    background = lightGrey,
    componentBackground = white
)
