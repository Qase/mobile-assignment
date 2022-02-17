package com.example.rocketapp.rocket.list

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.lifecycleScope
import androidx.lifecycle.repeatOnLifecycle
import androidx.lifecycle.viewModelScope
import com.example.rocketapp.MainActivity
import com.example.rocketapp.R
import com.example.rocketapp.databinding.FragmentRocketListBinding
import com.example.rocketapp.tools.BaseFragment
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch

@AndroidEntryPoint
class RocketListFragment: BaseFragment<FragmentRocketListBinding>() {

    private val rocketListViewModel: RocketListViewModel by viewModels()

    override val bindingInflater = { layoutInflater: LayoutInflater, parent: ViewGroup? ->
        FragmentRocketListBinding.inflate(layoutInflater, parent, false)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setActionBar {
            title = getString(R.string.rockets)
        }
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.txtTitle.setOnClickListener {
            navController.navigate(R.id.action_rocket_list_to_rocket_detail)
        }

        lifecycleScope.launch {
            viewLifecycleOwner.repeatOnLifecycle(Lifecycle.State.STARTED) {
                rocketListViewModel.rocketsData.collect { result ->
                    val list = result?.getOrNull()
                    Log.d(TAG, "reload list result is: $list")
                }
            }
        }
    }

    companion object {
        private const val TAG = "RocketListFragment"
    }

}