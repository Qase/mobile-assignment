package com.example.rocketapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.activity.viewModels
import androidx.fragment.app.viewModels
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.lifecycleScope
import androidx.lifecycle.repeatOnLifecycle
import com.example.rocketapp.rocket.list.RocketListFragment
import com.example.rocketapp.rocket.list.RocketListViewModel
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch
import kotlin.coroutines.CoroutineContext

@AndroidEntryPoint
class MainActivity : AppCompatActivity(), CoroutineScope {

    private val rocketListViewModel: RocketListViewModel by viewModels()

    override val coroutineContext: CoroutineContext = Dispatchers.Main

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