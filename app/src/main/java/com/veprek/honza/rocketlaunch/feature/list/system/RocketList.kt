package com.veprek.honza.rocketlaunch.feature.list.system

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.veprek.honza.rocketlaunch.repository.model.Rocket

@Composable
fun RocketList(modifier: Modifier = Modifier, rockets: List<Rocket>, toDetailAction: (String) -> Unit = {}) {
    ShowRocketsList(modifier = modifier, rockets = rockets, toDetailAction = toDetailAction)
}
