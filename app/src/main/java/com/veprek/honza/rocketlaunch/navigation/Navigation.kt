package com.veprek.honza.rocketlaunch.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.veprek.honza.rocketlaunch.feature.detail.system.RocketDetailScreen
import com.veprek.honza.rocketlaunch.feature.launch.system.RocketLaunchScreen
import com.veprek.honza.rocketlaunch.feature.list.system.RocketListScreen

@Composable
fun Navigation() {
    val navController = rememberNavController()

    NavHost(
        navController = navController,
        startDestination = NavigationScreens.RocketListScreen.route
    ) {
        composable(route = NavigationScreens.RocketListScreen.route) {
            RocketListScreen(navController = navController)
        }

        composable(
            route = NavigationScreens.RocketDetailScreen.route + "/{id}",
            arguments = listOf(
                navArgument(name = "id") {
                    type = NavType.StringType
                }
            )
        ) { entry ->
            RocketDetailScreen(
                navController,
                entry.arguments?.getString("id")
            )
        }

        composable(
            route = NavigationScreens.RocketLaunchScreen.route
        ) {
            RocketLaunchScreen(
                navController = navController
            )
        }
    }
}
