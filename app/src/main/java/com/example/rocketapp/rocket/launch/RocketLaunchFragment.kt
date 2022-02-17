package com.example.rocketapp.rocket.launch

import android.view.LayoutInflater
import android.view.ViewGroup
import com.example.rocketapp.databinding.FragmentRocketLaunchBinding
import com.example.rocketapp.databinding.FragmentRocketListBinding
import com.example.rocketapp.tools.BaseFragment

class RocketLaunchFragment: BaseFragment<FragmentRocketLaunchBinding>() {

    override val bindingInflater = { layoutInflater: LayoutInflater, parent: ViewGroup? ->
        FragmentRocketLaunchBinding.inflate(layoutInflater, parent, false)
    }
}