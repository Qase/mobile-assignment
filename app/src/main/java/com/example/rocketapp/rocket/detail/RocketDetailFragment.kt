package com.example.rocketapp.rocket.detail

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.rocketapp.R
import com.example.rocketapp.databinding.FragmentRocketDetailBinding
import com.example.rocketapp.databinding.FragmentRocketListBinding
import com.example.rocketapp.tools.BaseFragment

class RocketDetailFragment: BaseFragment<FragmentRocketDetailBinding>() {

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