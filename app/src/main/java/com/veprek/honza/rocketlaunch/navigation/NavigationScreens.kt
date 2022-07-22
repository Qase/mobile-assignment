package com.veprek.honza.rocketlaunch.navigation

sealed class NavigationScreens(val route: String) {
    object RocketDetailScreen : NavigationScreens("rocket_detail_screen")
    object RocketLaunchScreen : NavigationScreens("rocket_launch_screen")
    object RocketListScreen : NavigationScreens("rocket_detail_screen")
}
