package com.veprek.honza.rocketlaunch.feature.launch.system

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.FastOutLinearInEasing
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.animation.slideOut
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Scaffold
import androidx.compose.material.Text
import androidx.compose.material.TopAppBar
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.IntOffset
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.repository.model.RocketState
import com.veprek.honza.rocketlaunch.ui.theme.verticalPadding

@Composable
fun RocketLaunchScreen(
    modifier: Modifier = Modifier,
    state: RocketState,
    launched: Boolean = true,
    backAction: () -> Unit = {}
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(stringResource(R.string.icon_launch)) },
                navigationIcon = {
                    IconButton(onClick = {
                        backAction()
                    }) {
                        Icon(
                            imageVector = Icons.Filled.ArrowBack,
                            contentDescription = stringResource(R.string.icon_back)
                        )
                    }
                }
            )
        }
    ) {
        Column(
            verticalArrangement = Arrangement.Bottom,
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.fillMaxSize()
        ) {
            val angle by when (state) {
                RocketState.WAITING, RocketState.LAUNCHED -> {
                    animateFloatAsState(
                        targetValue = 0f
                    )
                }
                RocketState.FAILED -> {
                    animateFloatAsState(
                        targetValue = 90f,
                        animationSpec = tween(durationMillis = 1000)
                    )
                }
            }
            val exitTransition = when (state) {
                RocketState.WAITING, RocketState.LAUNCHED -> {
                    slideOutVertically(
                        targetOffsetY = { -1500 },
                        animationSpec = tween(
                            durationMillis = 1000,
                            easing = FastOutLinearInEasing
                        )
                    )
                }
                RocketState.FAILED -> {
                    slideOut(
                        targetOffset = { IntOffset(500, -100) },
                        animationSpec = tween(
                            durationMillis = 1000,
                            easing = FastOutLinearInEasing
                        )
                    )
                }
            }
            val image = when (state) {
                RocketState.WAITING, RocketState.FAILED -> {
                    painterResource(R.drawable.rocket_idle)
                }
                RocketState.LAUNCHED -> {
                    painterResource(R.drawable.rocket_flying)
                }
            }
            val text = when (state) {
                RocketState.WAITING -> {
                    stringResource(R.string.launch_initial)
                }
                RocketState.LAUNCHED -> {
                    stringResource(R.string.launch_successful)
                }
                RocketState.FAILED -> {
                    stringResource(R.string.launch_failed)
                }
            }

            AnimatedVisibility(
                visible = launched,
                modifier = Modifier.rotate(angle),
                exit = exitTransition
            ) {
                Image(
                    painter = image,
                    contentDescription = stringResource(R.string.icon_rocket)
                )
            }
            Text(
                modifier = Modifier.padding(bottom = verticalPadding),
                text = text,
                style = MaterialTheme.typography.body1
            )
        }
    }
}
