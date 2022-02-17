package com.example.rocketapp.rocket.list

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import androidx.lifecycle.lifecycleScope
import com.example.rocketapp.MainActivity
import com.example.rocketapp.R
import com.example.rocketapp.databinding.FragmentRocketListBinding
import com.example.rocketapp.tools.BaseFragment
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.launch

@AndroidEntryPoint
class RocketListFragment: BaseFragment<FragmentRocketListBinding>() {

    private val rocketListViewModel: RocketListViewModel by viewModels()

    override val bindingInflater = { layoutInflater: LayoutInflater, parent: ViewGroup? ->
        FragmentRocketListBinding.inflate(layoutInflater, parent, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.txtTitle.setOnClickListener {
            navController.navigate(R.id.action_rocket_list_to_rocket_detail)
        }
        //TODO bude upraveno
        rocketListViewModel.rocketsData.observe(viewLifecycleOwner) {
            Log.d(TAG, "rocketsData reloaded")
            Log.d(TAG, it.toString())
        }
        lifecycleScope.launch {
            rocketListViewModel.loadRockets()
        }
    }

    companion object {
        private const val TAG = "√"
    }

}