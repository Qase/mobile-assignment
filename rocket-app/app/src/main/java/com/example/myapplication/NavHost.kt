package com.example.myapplication

import androidx.compose.foundation.layout.padding
import androidx.compose.material.Scaffold
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.rocket_list.system.RocketListScreen

@Composable
fun RocketAppNavHost() {
    val navController = rememberNavController()

    Scaffold(
    ) { innerPadding ->
        NavHost(navController, Screen.RocketList.route, Modifier.padding(innerPadding)) {
            composable(Screen.RocketList.route) { RocketListScreen()}
        }
    }
}
