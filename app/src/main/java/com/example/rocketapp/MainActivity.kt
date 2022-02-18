package com.example.rocketapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.viewModels
import androidx.navigation.NavController
import androidx.navigation.findNavController
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.setupActionBarWithNavController
import com.example.rocketapp.rocket.list.RocketListViewModel
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {

    override fun onSupportNavigateUp(): Boolean {
        val navController = getNavController()
        return navController.navigateUp() || super.onSupportNavigateUp()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val navController = getNavController()
        val mainFragmentIds = setOf(
            R.id.rocket_list
        )
        val appBarConfiguration = AppBarConfiguration(mainFragmentIds)
        setupActionBarWithNavController(navController, appBarConfiguration)
    }

    private fun getNavController(): NavController {
        return findNavController(R.id.nav_host_fragment_activity)
    }

    companion object {
        private const val TAG = "MainActivity"
    }

}