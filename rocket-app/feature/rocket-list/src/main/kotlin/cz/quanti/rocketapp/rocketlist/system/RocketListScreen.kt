package com.example.rocket_list.system

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Divider
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import cz.quanti.rocketapp.rocketlist.R
import cz.quanti.rocketapp.rocketlist.presentation.RocketItemState
import cz.quanti.rocketapp.rocketlist.presentation.RocketListState
import cz.quanti.rocketapp.rocketlist.presentation.RocketListViewModel

@Composable
fun RocketListScreen(navigateToRocketDetail: (String) -> Unit) {
    val viewModel = viewModel<RocketListViewModel>()
    val rocketListState: RocketListState by viewModel.rockets.collectAsState()

    RocketList(rocketListState.rockets, navigateToRocketDetail)
}

@Composable
fun RocketList(rockets: List<RocketItemState>, navigateToRocketDetail: (String) -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(color = colorResource(id = R.color.lightGray))
    ) {
        Text(
            text = stringResource(R.string.rockets),
            style = MaterialTheme.typography.h3,
            modifier = Modifier.padding(start = 8.dp, top = 40.dp)
        )

        LazyColumn(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier
                .padding(8.dp)
                .clip(RoundedCornerShape(20.dp))
        ) {
            items(rockets) {
                RocketCard(it, navigateToRocketDetail)
                Divider(color = Color.LightGray)
            }
        }
    }

}