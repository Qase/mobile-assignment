package com.veprek.honza.rocketlaunch.feature.detail

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Scaffold
import androidx.compose.material.Text
import androidx.compose.material.TopAppBar
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import coil.compose.AsyncImage
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.repository.model.Rocket
import com.veprek.honza.rocketlaunch.repository.model.State
import com.veprek.honza.rocketlaunch.ui.component.loading.Loading
import com.veprek.honza.rocketlaunch.ui.component.parameter.Parameter
import com.veprek.honza.rocketlaunch.ui.component.stage.Stage
import com.veprek.honza.rocketlaunch.ui.theme.cornerRadius
import com.veprek.honza.rocketlaunch.ui.theme.horizontalPadding
import com.veprek.honza.rocketlaunch.ui.theme.verticalPadding

@Composable
fun RocketDetailScreen(
    rocket: Rocket?,
    state: State,
    backAction: () -> Unit = {},
    launchAction: () -> Unit = {}
) {
    when (state) {
        State.LOADING -> {
            Loading()
        }
        State.SUCCESS -> {
            rocket?.let {
                Scaffold(
                    topBar = {
                        TopAppBar(
                            title = { Text(rocket.name) },
                            navigationIcon = {
                                IconButton(onClick = {
                                    backAction()
                                }) {
                                    Icon(
                                        imageVector = Icons.Filled.ArrowBack,
                                        contentDescription = stringResource(R.string.icon_back)
                                    )
                                }
                            },
                            actions = {
                                IconButton(onClick = {
                                    launchAction()
                                }) {
                                    Icon(
                                        painter = painterResource(id = R.drawable.ic_rocket),
                                        contentDescription = stringResource(R.string.icon_launch)
                                    )
                                }
                            }
                        )
                    },
                    content = {
                        Column(
                            Modifier
                                .fillMaxSize()
                                .padding(horizontal = horizontalPadding)
                                .verticalScroll(rememberScrollState()),
                            verticalArrangement = Arrangement.spacedBy(verticalPadding)
                        ) {
                            Text(
                                stringResource(R.string.overview),
                                modifier = Modifier.padding(top = verticalPadding),
                                style = MaterialTheme.typography.h4
                            )
                            Text(
                                rocket.description,
                                style = MaterialTheme.typography.body1
                            )
                            Text(
                                stringResource(R.string.parameters),
                                style = MaterialTheme.typography.h4
                            )
                            Row(
                                Modifier
                                    .fillMaxWidth(),
                                horizontalArrangement = Arrangement.SpaceBetween
                            ) {
                                Parameter(
                                    title = stringResource(R.string.param_height_m, rocket.height.meters),
                                    subtitle = stringResource(R.string.parameter_height)
                                )
                                Parameter(
                                    title = stringResource(R.string.param_diameter_m, rocket.diameter.meters),
                                    subtitle = stringResource(R.string.parameter_diameter)
                                )
                                Parameter(
                                    title = stringResource(R.string.param_mass_t, rocket.mass.t),
                                    subtitle = stringResource(R.string.parameter_mass)
                                )
                            }
                            Stage(name = stringResource(R.string.first_stage), stage = rocket.firstStage)
                            Stage(name = stringResource(R.string.second_stage), stage = rocket.secondStage)
                            Text(
                                stringResource(R.string.photos),
                                style = MaterialTheme.typography.h4
                            )
                            rocket.images.forEach {
                                AsyncImage(
                                    model = it,
                                    contentDescription = null,
                                    modifier = Modifier
                                        .clip(RoundedCornerShape(cornerRadius))
                                        .align(Alignment.CenterHorizontally)
                                )
                            }
                        }
                    }
                )
            }
        }
        else -> {
            Text(stringResource(R.string.error))
        }
    }
}
