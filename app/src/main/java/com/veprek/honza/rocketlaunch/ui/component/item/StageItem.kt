package com.veprek.honza.rocketlaunch.ui.component.item

import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Icon
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.painter.Painter
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
import com.veprek.honza.rocketlaunch.ui.theme.pink
import com.veprek.honza.rocketlaunch.ui.theme.smallPadding

@Composable
fun StageItem(icon: Painter, iconColor: Color = pink, name: String) {
    Row(
        Modifier.fillMaxWidth().padding(smallPadding)
    ) {
        Icon(painter = icon, tint = iconColor, modifier = Modifier.padding(end = smallPadding), contentDescription = "icon")
        Text(name, style = MaterialTheme.typography.body1)
    }
}

@Preview(showBackground = true)
@Composable
fun StageItemPreview(icon: Painter = painterResource(R.drawable.reusable), name: String = "reusable") {
    RocketLaunchTheme {
        StageItem(icon = icon, name = name)
    }
}
