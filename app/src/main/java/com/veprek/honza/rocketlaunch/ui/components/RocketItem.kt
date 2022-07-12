package com.veprek.honza.rocketlaunch.ui.components

import android.graphics.Paint.Align
import androidx.compose.animation.AnimatedContentScope.SlideDirection.Companion.End
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement.End
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material.Icon
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Alignment.Companion.End
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.ui.theme.Pink

@Preview(showBackground = true)
@Composable
fun Item() {
    Row(Modifier.fillMaxWidth(), verticalAlignment = Alignment.CenterVertically) {
        Image(
            painter = painterResource(R.drawable.ic_rocket),
            colorFilter = ColorFilter.tint(Pink),
            contentDescription = "Rocket icon"
        )
        Column() {
            Text("Falcon 1")
            Text("Last flight: 24.3.2006")
        }
        Icon(imageVector = Icons.Filled.ArrowDropDown, contentDescription = "next")
    }
}
