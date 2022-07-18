package com.veprek.honza.rocketlaunch.system.list

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.veprek.honza.rocketlaunch.model.Rocket

@Composable
fun RocketList(modifier: Modifier = Modifier, rockets: List<Rocket>, toDetailAction: (String) -> Unit = {}) {
    ShowRocketsList(modifier = modifier, rockets = rockets, toDetailAction = toDetailAction)
}
