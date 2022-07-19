package com.veprek.honza.rocketlaunch.system.list

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.model.State
import com.veprek.honza.rocketlaunch.ui.component.loading.Loading
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
import com.veprek.honza.rocketlaunch.ui.theme.horizontalPadding
import com.veprek.honza.rocketlaunch.ui.theme.verticalPadding

@Composable
fun RocketListScreen(
    rockets: List<Rocket>?,
    state: State,
    toDetailAction: (String) -> Unit = {}
) {
    Surface {
        Column(
            Modifier.fillMaxSize().padding(horizontal = horizontalPadding),
            verticalArrangement = Arrangement.spacedBy(verticalPadding)
        ) {
            when (state) {
                State.LOADING -> {
                    Loading()
                }
                State.SUCCESS -> {
                    Text(
                        stringResource(R.string.rockets),
                        modifier = Modifier.padding(top = verticalPadding),
                        style = MaterialTheme.typography.h1
                    )
                    RocketList(rockets = rockets ?: listOf(), toDetailAction = toDetailAction)
                }
                else -> {
                    Text(stringResource(R.string.error))
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun RocketListScreenPreview(modifier: Modifier = Modifier, rockets: List<Rocket> = listOf(), state: State = State.LOADING) {
    RocketLaunchTheme {
        RocketListScreen(rockets = rockets, state = state)
    }
}
