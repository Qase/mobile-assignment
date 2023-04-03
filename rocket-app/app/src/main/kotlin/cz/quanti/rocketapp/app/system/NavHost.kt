package cz.quanti.rocketapp.app.system

import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import cz.quanti.rocketapp.rocketdetail.system.RocketDetailScreen
import cz.quanti.rocketapp.rocketlist.system.RocketListScreen
import org.koin.androidx.compose.koinViewModel

const val ARG_ROCKET_ID = "rocketId"

@Composable
fun RocketAppNavHost() {
    val navController = rememberNavController()

    Surface(
        modifier = Modifier.fillMaxSize()
    ) {
        NavHost(navController, Screen.RocketList.route) {
            composable(Screen.RocketList.route) {
                RocketListScreen(koinViewModel()) {
                    navController.navigate("${Screen.RocketDetail.route}/$it")
                }
            }

            composable(
                "${Screen.RocketDetail.route}/{$ARG_ROCKET_ID}",
                arguments = listOf(navArgument(ARG_ROCKET_ID) { type = NavType.StringType })
            ) { backStackEntry ->
                backStackEntry.arguments?.getString(ARG_ROCKET_ID)?.let {
                    RocketDetailScreen(it) {
                        navController.popBackStack()
                    }
                }
            }
        }
    }
}
