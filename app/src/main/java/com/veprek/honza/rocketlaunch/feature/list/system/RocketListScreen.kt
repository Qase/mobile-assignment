package com.veprek.honza.rocketlaunch.feature.list.system

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.google.accompanist.swiperefresh.SwipeRefresh
import com.google.accompanist.swiperefresh.rememberSwipeRefreshState
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.feature.list.presentation.RocketListViewModel
import com.veprek.honza.rocketlaunch.repository.model.Rocket
import com.veprek.honza.rocketlaunch.repository.model.State
import com.veprek.honza.rocketlaunch.ui.component.error.Error
import com.veprek.honza.rocketlaunch.ui.component.loading.Loading
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
import com.veprek.honza.rocketlaunch.ui.theme.horizontalPadding
import com.veprek.honza.rocketlaunch.ui.theme.verticalPadding

@Composable
fun RocketListScreen(
    navController: NavController,
    viewModel: RocketListViewModel = hiltViewModel()
) {
    val rockets = viewModel.rockets.collectAsState()
    val isRefreshing = viewModel.isRefreshing.collectAsState()
    val state = rockets.value.state

    Surface {
        SwipeRefresh(
            state = rememberSwipeRefreshState(isRefreshing = isRefreshing.value),
            onRefresh = { viewModel.refresh() }
        ) {
            when (state) {
                State.LOADING -> {
                    Loading()
                }
                State.SUCCESS -> {
                    Column(
                        Modifier
                            .fillMaxSize()
                            .verticalScroll(rememberScrollState())
                            .padding(horizontal = horizontalPadding),
                        verticalArrangement = Arrangement.spacedBy(verticalPadding)
                    ) {
                        Text(
                            stringResource(R.string.rockets),
                            modifier = Modifier.padding(top = verticalPadding),
                            style = MaterialTheme.typography.h1
                        )
                        RocketList(
                            rockets = rockets.value.data ?: listOf(),
                            navController = navController
                        )
                    }
                }
                else -> {
                    Error()
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun RocketListScreenPreview(
    modifier: Modifier = Modifier,
    rockets: List<Rocket> = listOf(),
    state: State = State.LOADING
) {
    RocketLaunchTheme {
//        RocketListScreen()
    }
}
