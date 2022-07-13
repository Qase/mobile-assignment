package com.veprek.honza.rocketlaunch.ui.theme

import androidx.compose.material.Typography
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import com.veprek.honza.rocketlaunch.R

val fonts = FontFamily(
    Font(R.font.dm_sans_regular, weight = FontWeight.Normal),
    Font(R.font.dm_sans_medium, weight = FontWeight.Medium),
    Font(R.font.dm_sans_mediumitalic, weight = FontWeight.Medium, style = FontStyle.Italic),
    Font(R.font.dm_sans_bold, weight = FontWeight.Bold),
    Font(R.font.dm_sans_italic, style = FontStyle.Italic),
    Font(R.font.dm_sans_bolditalic, weight = FontWeight.Bold, style = FontStyle.Italic)
)

val DMSansTypography = Typography(
    fonts
    /* Other default text styles to override
    button = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.W500,
        fontSize = 14.sp
    ),
    caption = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Normal,
        fontSize = 12.sp
    )
    */
)
