package com.veprek.honza.rocketlaunch

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.veprek.honza.rocketlaunch.navigation.Navigation
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            RocketLaunchTheme() {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    RocketLaunchApp {
                        Navigation()
                    }
                }
            }
        }
//        setContentView(R.layout.activity_main)
    }
}

@Composable
fun RocketLaunchApp(content: @Composable () -> Unit) {
    RocketLaunchTheme() {
        content()
    }
}
