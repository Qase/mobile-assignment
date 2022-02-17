package com.example.rocketapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.activity.viewModels
import androidx.lifecycle.lifecycleScope
import com.example.rocketapp.rocket.MainViewModel
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.launch
import kotlin.coroutines.CoroutineContext

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {


    private val mainViewModel: MainViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        mainViewModel.rocketsData.observe(this) {
            Log.d(TAG, "rocketsData reloaded")
            Log.d(TAG, it.toString())
        }

        lifecycleScope.launch {
        //TODO bude odstraneno
            mainViewModel.loadRockets()
        }
    }

    companion object {
        private const val TAG = "MainActivity"
    }

}