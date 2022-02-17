package com.example.rocketapp.rocket.detail

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import com.example.rocketapp.R
import com.example.rocketapp.databinding.FragmentRocketDetailBinding
import com.example.rocketapp.databinding.FragmentRocketListBinding
import com.example.rocketapp.rocket.list.RocketListViewModel
import com.example.rocketapp.tools.BaseFragment

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
    }

}