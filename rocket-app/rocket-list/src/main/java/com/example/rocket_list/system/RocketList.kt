package com.example.rocket_list.system

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.rocket_list.presentation.RocketViewModel
import com.example.rocket_repo.model.Rocket

@Composable
fun RocketListScreen() {
    val viewModel = viewModel<RocketViewModel>()
    val rockets: List<Rocket> by viewModel.rockets.observeAsState(emptyList())
    viewModel.getRockets()

    RocketList(rockets)
}

@Composable
fun RocketList(rockets: List<Rocket>) {
    Column(
        modifier = Modifier.background(Color.LightGray)
    ) {
        Text(
            text = "Rockets",
            style = MaterialTheme.typography.h2
        )
        LazyColumn {
            items(rockets) {
                RocketCard(rocket = it)
            }
        }
    }

}