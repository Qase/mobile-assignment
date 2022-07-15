package com.veprek.honza.rocketlaunch.system.list

import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.ui.component.item.RocketItem

@Composable
fun RocketList(modifier: Modifier = Modifier, rockets: List<Rocket>, toDetailAction: (String) -> Unit = {}) {
    LazyColumn {
        items(rockets) { item -> RocketItem(item, toDetailAction = toDetailAction) }
    }
}
