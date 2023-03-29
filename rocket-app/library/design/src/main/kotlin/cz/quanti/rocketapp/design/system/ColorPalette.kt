package cz.quanti.rocketapp.design.system

import androidx.compose.ui.graphics.Color

data class RocketAppColorPalette(
   val rocketListScreenBackgroundColor: Color,
   val rocketListItemBackgroundColor: Color,
   val iconButtonColor: Color
)

val rocketAppColorPalette = RocketAppColorPalette(
    rocketListScreenBackgroundColor = lightGrey,
    rocketListItemBackgroundColor = Color.White,
    iconButtonColor = lightGrey
)