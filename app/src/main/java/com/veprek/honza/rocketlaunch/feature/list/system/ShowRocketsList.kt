package com.veprek.honza.rocketlaunch.feature.list.system

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.veprek.honza.rocketlaunch.repository.model.Rocket
import com.veprek.honza.rocketlaunch.ui.component.item.RocketItem
import com.veprek.honza.rocketlaunch.ui.theme.cornerRadius

@Composable
fun ShowRocketsList(
    modifier: Modifier = Modifier,
    rockets: List<Rocket>,
    toDetailAction: (String) -> Unit = {}
) {
    Surface(modifier = modifier, shape = RoundedCornerShape(cornerRadius)) {
        Column() {
            rockets.forEach {
                RocketItem(it, toDetailAction = toDetailAction)
            }
        }
    }
}
