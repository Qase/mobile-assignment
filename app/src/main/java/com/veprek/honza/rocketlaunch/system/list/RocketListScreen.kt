package com.veprek.honza.rocketlaunch.system.list

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
import com.veprek.honza.rocketlaunch.ui.theme.horizontalPadding
import com.veprek.honza.rocketlaunch.ui.theme.verticalPadding

@Composable
fun RocketListScreen(
    rockets: List<Rocket>,
    toDetailAction: (String) -> Unit = {}
) {
    Column(
        Modifier.fillMaxSize().padding(horizontal = horizontalPadding),
        verticalArrangement = Arrangement.spacedBy(verticalPadding)
    ) {
        Text(
            stringResource(R.string.rockets),
            modifier = Modifier.padding(top = verticalPadding),
            style = MaterialTheme.typography.h1
        )
        RocketList(rockets = rockets, toDetailAction = toDetailAction)
    }
}

@Preview(showBackground = true)
@Composable
fun RocketListScreenPreview(modifier: Modifier = Modifier, rockets: List<Rocket> = listOf()) {
    RocketLaunchTheme {
        RocketListScreen(rockets = rockets)
    }
}
