package cz.quanti.rocketapp.rocketlist.system

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Divider
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.res.stringResource
import cz.quanti.rocketapp.design.system.RocketAppTheme
import cz.quanti.rocketapp.rocketlist.R
import cz.quanti.rocketapp.rocketlist.presentation.RocketItemState
import cz.quanti.rocketapp.rocketlist.presentation.RocketListState
import cz.quanti.rocketapp.rocketlist.presentation.RocketListViewModel

@Composable
fun RocketListScreen(viewModel: RocketListViewModel, navigateToRocketDetail: (String) -> Unit) {
    val rocketListState: RocketListState by viewModel.rockets.collectAsState()
    RocketList(rocketListState.rockets, navigateToRocketDetail)
}

@Composable
fun RocketList(rockets: List<RocketItemState>, navigateToRocketDetail: (String) -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(RocketAppTheme.colors.background)
    ) {
        Text(
            text = stringResource(R.string.rockets),
            style = RocketAppTheme.typography.screenTitle,
            color = RocketAppTheme.colors.textPrimary,
            modifier = Modifier
                .padding(
                    start = RocketAppTheme.dimensions.sidePadding,
                    top = RocketAppTheme.dimensions.titleTopPadding
                )
        )

        LazyColumn(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier
                .padding(RocketAppTheme.dimensions.sidePadding)
                .clip(RoundedCornerShape(RocketAppTheme.dimensions.roundCorners))
        ) {
            items(rockets) {
                RocketCard(it, navigateToRocketDetail)
                Divider(color = RocketAppTheme.colors.background)
            }
        }
    }
}
