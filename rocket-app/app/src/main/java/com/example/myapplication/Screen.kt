package com.example.myapplication

import androidx.annotation.StringRes

sealed class Screen(val route: String, @StringRes resId: Int) {
    object RocketList : Screen("rocketList", R.string.rocketList)
    object RocketDetail : Screen("rocketDetail", R.string.rocketDetail)
    object RocketLaunch : Screen("rocketLaunch", R.string.rocketLaunch)
}
