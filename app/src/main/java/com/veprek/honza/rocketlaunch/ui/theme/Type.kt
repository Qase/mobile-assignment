package com.veprek.honza.rocketlaunch.ui.theme

import androidx.compose.material.Typography
import androidx.compose.ui.text.TextStyle
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
    fonts,
    h1 = TextStyle(
        fontFamily = fonts,
        fontWeight = FontWeight.Bold,
        fontSize = textH1
    ),
    h2 = TextStyle(
        fontFamily = fonts,
        fontWeight = FontWeight.Bold,
        fontSize = textH2
    ),
    h4 = TextStyle(
        fontFamily = fonts,
        fontWeight = FontWeight.Bold,
        fontSize = textH4
    ),
    body1 = TextStyle(
        fontFamily = fonts,
        fontSize = textBody1
    ),
    subtitle1 = TextStyle(
        fontFamily = fonts,
        fontSize = textSubtitle1
    )
// /* Other default text styles to override

// caption = TextStyle(
//    fontFamily = FontFamily.Default,
//    fontWeight = FontWeight.Normal,
//    fontSize = 12.sp
// )
// */
)
