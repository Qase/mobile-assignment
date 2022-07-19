package com.veprek.honza.rocketlaunch.system.list

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.platform.ComposeView
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.navigation.findNavController
import com.veprek.honza.rocketlaunch.model.Height
import com.veprek.honza.rocketlaunch.model.Mass
import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.model.Stage
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class RocketListFragment : Fragment() {
    private val viewModel: RocketListViewModel by viewModels()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        return ComposeView(requireContext()).apply {
            // TODO: From repository, in viewModel
            val rocket1 =
                Rocket("1", true, "Falcon 1", "24. 3. 2006", "Desc", Height(12.0, 12.0), Height(40.0, 40.0), Mass(55, 55), Stage(true, 27, 1155.0, 162.0), Stage(false, 1, 90.0, 397.0), listOf("https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg", "https://farm5.staticflickr.com/4645/38583830575_3f0f7215e6_b.jpg"))
            val rocket2 =
                Rocket("2", true, "Falcon 9", "24. 3. 2006", "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft into orbit.", Height(12.0, 12.0), Height(40.0, 40.0), Mass(55, 55), Stage(true, 27, 1155.0, 162.0), Stage(false, 1, 90.0, 397.0), listOf("https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg", "https://farm5.staticflickr.com/4645/38583830575_3f0f7215e6_b.jpg"))
            val rocket3 =
                Rocket("3", true, "Falcon Heavy", "24. 3. 2006", "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft into orbit.", Height(12.0, 12.0), Height(40.0, 40.0), Mass(55, 55), Stage(true, 27, 1155.0, 162.0), Stage(false, 1, 90.0, 397.0), listOf("https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg", "https://farm5.staticflickr.com/4645/38583830575_3f0f7215e6_b.jpg"))

            setContent {
                val rockets = viewModel.rockets.collectAsState()
                RocketLaunchTheme() {
                    RocketListScreen(
                        rockets = rockets.value.data,
                        state = rockets.value.state,
                        toDetailAction = {
                            val action =
                                RocketListFragmentDirections.actionRocketListFragmentToRocketDetailFragment()
                            findNavController().navigate(action)
                        }
                    )
                }
            }
        }
    }
}
