package com.example.myapplication

import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Scaffold
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.example.rocket_detail.system.RocketDetailScreen
import com.example.rocket_list.system.RocketListScreen

@Composable
fun RocketAppNavHost() {
    val navController = rememberNavController()


    Scaffold (
        modifier = Modifier.fillMaxSize()
    ){ innerPadding ->
        NavHost(navController, Screen.RocketList.route, Modifier.padding(innerPadding)) {

            composable(Screen.RocketList.route) {
                RocketListScreen {
                    navController.navigate("${Screen.RocketDetail.route}/$it")
                }
            }

            composable(
                "${Screen.RocketDetail.route}/{rocketId}",
                arguments = listOf(navArgument("rocketId") { type = NavType.StringType })
            ) { backStackEntry ->
                backStackEntry.arguments?.getString("rocketId")?.let { RocketDetailScreen(it) }
            }
        }
    }
}

