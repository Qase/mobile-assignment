package com.example.rocketapp.rocket.launch

import android.os.Bundle
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import com.example.rocketapp.R
import com.example.rocketapp.databinding.FragmentRocketLaunchBinding
import com.example.rocketapp.databinding.FragmentRocketListBinding
import com.example.rocketapp.rocket.list.RocketListViewModel
import com.example.rocketapp.tools.BaseFragment
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class RocketLaunchFragment: BaseFragment<FragmentRocketLaunchBinding>() {

    private val rocketLaunchViewModel: RocketLaunchViewModel by viewModels()

    override val bindingInflater = { layoutInflater: LayoutInflater, parent: ViewGroup? ->
        FragmentRocketLaunchBinding.inflate(layoutInflater, parent, false)
    }
}