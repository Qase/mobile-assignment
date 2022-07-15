package com.veprek.honza.rocketlaunch.system.launch

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.FastOutLinearInEasing
import androidx.compose.animation.core.tween
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.Button
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
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import com.veprek.honza.rocketlaunch.R

@Composable
fun RocketLaunchScreen(modifier: Modifier = Modifier, backAction: () -> Unit = {}) {
    var visible by remember {
        mutableStateOf(true)
    }

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
        },
        content = {
            Column(
                verticalArrangement = Arrangement.Bottom,
                horizontalAlignment = Alignment.CenterHorizontally,
                modifier = Modifier.fillMaxSize()
            ) {
                AnimatedVisibility(
                    visible = visible,
                    exit = slideOutVertically(
                        targetOffsetY = { -1200 },
                        animationSpec = tween(
                            durationMillis = 1000,
                            easing = FastOutLinearInEasing
                        )
                    )
                ) {
                    Image(
                        painter = if (visible) painterResource(R.drawable.rocket_idle) else painterResource(
                            R.drawable.rocket_flying
                        ),
                        contentDescription = stringResource(R.string.icon_rocket)
                    )
                }
                Text(
                    if (visible) stringResource(R.string.launch_initial) else stringResource(R.string.launch_successful),
                    style = MaterialTheme.typography.body1
                )
                Button(onClick = { visible = !visible }) {
                    Text(stringResource(R.string.launch))
                }
            }
        }
    )
}
