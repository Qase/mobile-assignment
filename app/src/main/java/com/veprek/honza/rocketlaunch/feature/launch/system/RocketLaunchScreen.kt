package com.veprek.honza.rocketlaunch.feature.launch.system

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
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
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalLifecycleOwner
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.IntOffset
import androidx.core.content.getSystemService
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.LifecycleOwner
import androidx.navigation.NavController
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.feature.launch.presentation.RocketLaunchViewModel
import com.veprek.honza.rocketlaunch.navigation.NavigationScreens
import com.veprek.honza.rocketlaunch.repository.model.RocketState
import com.veprek.honza.rocketlaunch.ui.theme.verticalPadding
import quanti.com.kotlinlog.Log
import kotlin.math.abs

@Composable
fun RocketLaunchScreen(
    modifier: Modifier = Modifier,
    navController: NavController,
    lifecycleOwner: LifecycleOwner = LocalLifecycleOwner.current
) {
    val viewModel: RocketLaunchViewModel = hiltViewModel()

    val context = LocalContext.current
    val sensorManager: SensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager

    var gravity: FloatArray? = null
    var geomagnetic: FloatArray? = null

    val launched = viewModel.isLaunched.collectAsState()
    val state = viewModel.rocketState.collectAsState().value

    val sensorEventListener = object : SensorEventListener {
        override fun onSensorChanged(event: SensorEvent?) {
            if (event?.sensor?.type == Sensor.TYPE_GRAVITY) {
                gravity = event.values
            }

            if (event?.sensor?.type == Sensor.TYPE_MAGNETIC_FIELD) {
                geomagnetic = event.values
            }

            if (gravity != null && geomagnetic != null) {
                val rotationMatrix = FloatArray(9)
                val inclinationMatrix = FloatArray(9)

                if (SensorManager.getRotationMatrix(
                        rotationMatrix,
                        inclinationMatrix,
                        gravity,
                        geomagnetic
                    )
                ) {
                    val orientation = FloatArray(3)
                    SensorManager.getOrientation(rotationMatrix, orientation)
                    val azimuth = Math.toDegrees(orientation[0].toDouble())
                    val pitch = Math.toDegrees(orientation[1].toDouble())
                    val roll = Math.toDegrees(orientation[2].toDouble())
                    Log.d("Orientation: $azimuth, $pitch, $roll")

                    if (abs(pitch + 10) >= 20) {
                        if (pitch < 0) viewModel.launch() else viewModel.fail()
                        Log.d("$this")
                        sensorManager.unregisterListener(this)
                    }
                }
            }
        }

        override fun onAccuracyChanged(p0: Sensor?, p1: Int) {}
    }

    sensorManager.registerListener(
        sensorEventListener,
        sensorManager.getDefaultSensor(Sensor.TYPE_GRAVITY),
        SensorManager.SENSOR_DELAY_NORMAL
    )
    sensorManager.registerListener(
        sensorEventListener,
        sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD),
        SensorManager.SENSOR_DELAY_NORMAL
    )

    Log.d("LaunchScreen")
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(stringResource(R.string.icon_launch)) },
                navigationIcon = {
                    IconButton(onClick = {
                        navController.popBackStack(NavigationScreens.RocketDetailScreen.route, inclusive = false)
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
                visible = launched.value,
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
