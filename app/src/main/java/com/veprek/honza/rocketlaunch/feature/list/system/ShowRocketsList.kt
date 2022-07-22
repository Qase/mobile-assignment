package com.veprek.honza.rocketlaunch.feature.list.system

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavController
import com.veprek.honza.rocketlaunch.repository.model.Rocket
import com.veprek.honza.rocketlaunch.ui.component.item.RocketItem
import com.veprek.honza.rocketlaunch.ui.theme.cornerRadius

@Composable
fun ShowRocketsList(
    modifier: Modifier = Modifier,
    rockets: List<Rocket>,
    navController: NavController
) {
    Surface(modifier = modifier, shape = RoundedCornerShape(cornerRadius)) {
        Column() {
            rockets.forEach {
                RocketItem(it, navController = navController)
            }
        }
    }
}
