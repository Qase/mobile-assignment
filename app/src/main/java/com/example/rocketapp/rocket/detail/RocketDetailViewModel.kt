package com.example.rocketapp.rocket.detail

import android.app.Application
import androidx.lifecycle.LiveData
import com.example.rocketapp.rocket.repository.SpaceXRocketRepositoryImpl
import com.example.rocketapp.rocket.repository.model.Rocket
import com.example.rocketapp.tools.BaseViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject

@HiltViewModel
class RocketDetailViewModel @Inject constructor(
) : BaseViewModel() {


}