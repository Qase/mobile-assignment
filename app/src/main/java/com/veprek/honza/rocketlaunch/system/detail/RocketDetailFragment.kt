package com.veprek.honza.rocketlaunch.system.detail

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.compose.ui.platform.ComposeView
import androidx.fragment.app.Fragment
import androidx.navigation.findNavController
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme

class RocketDetailFragment : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        return ComposeView(requireContext()).apply {
            setContent {
                RocketLaunchTheme {
                    RocketDetailScreen(
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
