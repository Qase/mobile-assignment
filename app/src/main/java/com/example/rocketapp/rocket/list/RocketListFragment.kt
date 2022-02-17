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
import com.example.rocketapp.rocket.list.adapter.RocketListAdapter
import com.example.rocketapp.tools.BaseFragment
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch

@AndroidEntryPoint
class RocketListFragment: BaseFragment<FragmentRocketListBinding>() {

    private val rocketListViewModel: RocketListViewModel by viewModels()

    private val rocketListAdapter by lazy {
        RocketListAdapter(requireContext())
    }

    override val bindingInflater = { layoutInflater: LayoutInflater, parent: ViewGroup? ->
        FragmentRocketListBinding.inflate(layoutInflater, parent, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setRocketListRecyclerView()
        lifecycleScope.launch {
            viewLifecycleOwner.repeatOnLifecycle(Lifecycle.State.STARTED) {
                rocketListViewModel.rocketsData.collect { result ->
                    val list = result?.getOrNull() ?: emptyList()
                    rocketListAdapter.updateList(list)
                }
            }
        }
    }

    private fun setRocketListRecyclerView() {
        binding.recyclerView.apply {
            adapter = rocketListAdapter
            setHasFixedSize(true)
        }
    }

    companion object {
        private const val TAG = "RocketListFragment"
    }
}
