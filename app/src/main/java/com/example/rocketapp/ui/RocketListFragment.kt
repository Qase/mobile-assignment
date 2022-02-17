package com.example.rocketapp.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import com.example.rocketapp.MainViewModel
import com.example.rocketapp.databinding.FragmentRocketListBinding
import com.example.rocketapp.tools.BaseFragment
import com.example.rocketapp.ui.adapter.RocketListAdapter

class RocketListFragment: BaseFragment() {

    private val mainViewModel: MainViewModel by viewModels()

    private var _binding: FragmentRocketListBinding? = null
    private val binding get() = _binding!!

    private var rocketListAdapter: RocketListAdapter? = null

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        rocketListAdapter = RocketListAdapter(requireContext())
        _binding = FragmentRocketListBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setRocketListRecyclerView()
        observerRocketListData()
    }

    private fun setRocketListRecyclerView() {
        binding.recyclerView.apply {
            adapter = rocketListAdapter
            setHasFixedSize(true)
        }
    }

    private fun observerRocketListData() {
        mainViewModel.rocketsData.observe(viewLifecycleOwner) {
            rocketListAdapter?.updateList(it)
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        rocketListAdapter = null
        _binding = null
    }

}