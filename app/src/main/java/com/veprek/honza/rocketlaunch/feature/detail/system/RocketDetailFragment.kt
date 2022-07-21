package com.veprek.honza.rocketlaunch.feature.detail.system

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.platform.ComposeView
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.navigation.findNavController
import androidx.navigation.fragment.navArgs
import com.veprek.honza.rocketlaunch.feature.detail.RocketDetailScreen
import com.veprek.honza.rocketlaunch.feature.detail.presentation.RocketDetailViewModel
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
import dagger.hilt.android.AndroidEntryPoint
import quanti.com.kotlinlog.Log

@AndroidEntryPoint
class RocketDetailFragment : Fragment() {
    private val viewModel: RocketDetailViewModel by viewModels()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val args: RocketDetailFragmentArgs by navArgs()
        Log.d("id: ${args.id}")
        viewModel.getRocket(args.id)

        return ComposeView(requireContext()).apply {
            setContent {
                val rocket = viewModel.rocket.collectAsState()
                RocketLaunchTheme {
                    RocketDetailScreen(
                        rocket = rocket.value.data,
                        state = rocket.value.state,
                        backAction = {
                            findNavController().popBackStack()
                        },
                        launchAction = {
                            val action = RocketDetailFragmentDirections.actionRocketDetailFragmentToRocketLaunchFragment()
                            findNavController().navigate(action)
                        }
                    )
                }
            }
        }
    }
}
