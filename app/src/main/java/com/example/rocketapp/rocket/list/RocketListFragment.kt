package com.example.rocketapp.rocket.list

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.rocketapp.R
import com.example.rocketapp.databinding.FragmentRocketListBinding
import com.example.rocketapp.tools.BaseFragment

class RocketListFragment: BaseFragment<FragmentRocketListBinding>() {

    override val bindingInflater = { layoutInflater: LayoutInflater, parent: ViewGroup? ->
        FragmentRocketListBinding.inflate(layoutInflater, parent, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.txtTitle.setOnClickListener {
            navController.navigate(R.id.action_rocket_list_to_rocket_detail)
        }
    }

}