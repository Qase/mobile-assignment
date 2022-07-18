package com.veprek.honza.rocketlaunch.ui.component.item

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.ExperimentalMaterialApi
import androidx.compose.material.Icon
import androidx.compose.material.ListItem
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.KeyboardArrowRight
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.model.Height
import com.veprek.honza.rocketlaunch.model.Mass
import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.model.Stage
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
import com.veprek.honza.rocketlaunch.ui.theme.pink
import com.veprek.honza.rocketlaunch.ui.theme.smallPadding

@OptIn(ExperimentalMaterialApi::class)
@Composable
fun RocketItem(rocket: Rocket, iconColor: Color = pink, toDetailAction: (String) -> Unit = {}) {
    ListItem(
        Modifier.fillMaxWidth().background(MaterialTheme.colors.background).clickable { toDetailAction(rocket.id) },
        trailing = {
            Icon(
                imageVector = Icons.Filled.KeyboardArrowRight,
                tint = Color.LightGray,
                contentDescription = stringResource(R.string.icon_next)
            )
        }
    ) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Icon(
                painter = painterResource(R.drawable.ic_rocket),
                tint = iconColor,
                modifier = Modifier.padding(end = smallPadding),
                contentDescription = stringResource(R.string.icon_rocket)
            )
            Column() {
                Text(rocket.name, style = MaterialTheme.typography.h4)
                Text(
                    stringResource(R.string.rocket_first_flight, rocket.firstFlight),
                    style = MaterialTheme.typography.caption
                )
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun RocketItemPreview() {
    val rocket = Rocket("1", true, "Falcon 1", "24. 3. 2006", "Desc", Height(12.0, 12.0), Height(40.0, 40.0), Mass(55, 55), Stage(true, 27, 1155, 162), Stage(false, 1, 90, 397), listOf("https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg", "https://farm5.staticflickr.com/4645/38583830575_3f0f7215e6_b.jpg"))
    RocketLaunchTheme {
        RocketItem(rocket)
    }
}
