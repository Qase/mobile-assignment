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
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.rocket_list.R
import com.example.rocket_list.presentation.RocketViewModel
import com.example.rocket_repo.model.Rocket

@Composable
fun RocketListScreen(navigateToRocketDetail: (String) -> Unit) {
    val viewModel = viewModel<RocketViewModel>()
    val rockets: List<Rocket> by viewModel.rockets.observeAsState(emptyList())
    viewModel.getRockets()

    RocketList(rockets, navigateToRocketDetail)
}

@Composable
fun RocketList(rockets: List<Rocket>, navigateToRocketDetail: (String) -> Unit) {
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