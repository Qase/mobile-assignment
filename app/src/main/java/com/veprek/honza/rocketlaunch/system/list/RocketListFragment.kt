package com.veprek.honza.rocketlaunch.system.list

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.compose.ui.platform.ComposeView
import androidx.fragment.app.Fragment
import androidx.navigation.findNavController
import com.veprek.honza.rocketlaunch.model.Rocket
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class RocketListFragment : Fragment() {
//    private val viewModel by hiltNavGraphViewModels<RocketListViewModel>(R.id.rocketListFragment)

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        return ComposeView(requireContext()).apply {
            val rocket1 =
                Rocket("1", true, "Falcon 1", "24. 3. 2006", "Desc", 12, 40, 55, true, 2, 12, 300)
            val rocket2 =
                Rocket(
                    "2",
                    true,
                    "Falcon 9",
                    "24. 3. 2006",
                    "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft into orbit.",
                    12,
                    40,
                    55,
                    true,
                    2,
                    12,
                    300
                )
            val rocket3 =
                Rocket("3", true, "Falcon Heavy", "24. 3. 2006", "Desc", 12, 40, 55, true, 2, 12, 300)
            val rockets = listOf(rocket1, rocket2, rocket3)
            setContent {
                RocketLaunchTheme() {
                    RocketListScreen(
                        rockets = rockets,
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
