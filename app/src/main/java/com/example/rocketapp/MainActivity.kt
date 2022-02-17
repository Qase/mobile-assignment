package com.example.rocketapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.activity.viewModels
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlin.coroutines.CoroutineContext

@AndroidEntryPoint
class MainActivity : AppCompatActivity(), CoroutineScope {

    override val coroutineContext: CoroutineContext = Dispatchers.Main

    private val mainViewModel: MainViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        mainViewModel.rocketsData.observe(this) {
            Log.d(TAG, "rocketsData reloaded")
            Log.d(TAG, it.toString())
        }
        //TODO bude odstraneno
        launch {
            mainViewModel.loadRockets()
        }
    }

    companion object {
        private const val TAG = "MainActivity"
    }

}