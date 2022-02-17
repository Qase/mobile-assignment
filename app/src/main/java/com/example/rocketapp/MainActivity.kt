package com.example.rocketapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.viewModels
import dagger.hilt.android.AndroidEntryPoint
import com.example.rocketapp.rocket.list.RocketListViewModel

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {

    private val rocketListViewModel: RocketListViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        if (savedInstanceState == null) {
            rocketListViewModel.loadRockets()
        }
    }

    companion object {
        private const val TAG = "MainActivity"
    }

}