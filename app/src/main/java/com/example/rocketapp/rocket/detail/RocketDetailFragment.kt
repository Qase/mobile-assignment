package com.example.rocketapp.rocket.detail

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.lifecycleScope
import androidx.lifecycle.repeatOnLifecycle
import com.example.rocketapp.R
import com.example.rocketapp.databinding.FragmentRocketDetailBinding
import com.example.rocketapp.databinding.FragmentRocketListBinding
import com.example.rocketapp.rocket.list.RocketListFragment
import com.example.rocketapp.rocket.list.RocketListViewModel
import com.example.rocketapp.tools.BaseFragment
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch

@AndroidEntryPoint
class RocketDetailFragment: BaseFragment<FragmentRocketDetailBinding>() {

    private val rocketDetailViewModel: RocketDetailViewModel by viewModels()

    override val bindingInflater = { layoutInflater: LayoutInflater, parent: ViewGroup? ->
        FragmentRocketDetailBinding.inflate(layoutInflater, parent, false)
    }


    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.txtTitle.setOnClickListener {
            navController.navigate(R.id.action_rocket_detail_to_rocket_launch)
        }
        rocketDetailViewModel.loadDetail(1)
        lifecycleScope.launch {
            viewLifecycleOwner.repeatOnLifecycle(Lifecycle.State.STARTED) {
                rocketDetailViewModel.rocketData.collect { rocket ->
                    Log.d(TAG, "reload list result is: $rocket")
                }
            }
        }
    }

    companion object {
        private const val TAG = "RocketDetailFragment"
    }

}