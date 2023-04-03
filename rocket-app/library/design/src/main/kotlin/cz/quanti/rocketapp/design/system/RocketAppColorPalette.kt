package cz.quanti.rocketapp.design.system

import androidx.compose.runtime.Immutable
import androidx.compose.ui.graphics.Color

@Immutable
data class RocketAppColorPalette(
   val rocketListScreenBackgroundColor: Color,
   val rocketListItemBackgroundColor: Color,
   val iconButtonColor: Color,
   val listDividerColor: Color
)

val rocketAppColorPalette = RocketAppColorPalette(
    rocketListScreenBackgroundColor = lightGrey,
    rocketListItemBackgroundColor = Color.White,
    iconButtonColor = lightGrey,
    listDividerColor = lightGrey
)