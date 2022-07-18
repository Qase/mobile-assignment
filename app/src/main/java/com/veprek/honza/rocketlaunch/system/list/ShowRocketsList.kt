package com.veprek.honza.rocketlaunch.system.list

import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.ui.component.item.RocketItem
import com.veprek.honza.rocketlaunch.ui.theme.cornerRadius

@Composable
fun ShowRocketsList(modifier: Modifier = Modifier, rockets: List<Rocket>, toDetailAction: (String) -> Unit = {}) {
    Surface(modifier = modifier, shape = RoundedCornerShape(cornerRadius)) {
        LazyColumn {
            items(rockets) { item -> RocketItem(item, toDetailAction = toDetailAction) }
        }
    }
}
