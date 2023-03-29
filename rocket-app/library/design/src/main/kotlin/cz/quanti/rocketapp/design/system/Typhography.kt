package cz.quanti.rocketapp.design.system

import androidx.compose.runtime.Immutable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp

@Immutable
data class RocketAppTypography(
    val screenTitle: TextStyle,
    val cardTitle: TextStyle,
    val cardBody: TextStyle
)

val rocketAppTypography = RocketAppTypography(
    screenTitle = TextStyle(
        color = Color.Black,
        fontWeight = FontWeight.Normal,
        fontSize = 48.sp,
        letterSpacing = 0.sp
    ),
    cardTitle = TextStyle(
        color = Color.Black,
        fontWeight = FontWeight.Medium,
        fontSize = 20.sp,
        letterSpacing = 0.15.sp
    ),
    cardBody = TextStyle(
        fontWeight = FontWeight.Normal,
        fontSize = 16.sp,
        letterSpacing = 0.15.sp
    )
)