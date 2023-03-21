package cz.quanti.rocketapp.app.system

sealed class Screen(val route: String) {
    object RocketList : Screen("rocketList")
    object RocketDetail : Screen("rocketDetail")
    object RocketLaunch : Screen("rocketLaunch")
}
