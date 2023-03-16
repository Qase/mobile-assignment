package com.example.rocket_detail.presentation

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.rocket_repo.data.rocketsMock
import com.example.rocket_repo.model.Rocket

class RocketDetailViewModel: ViewModel() {
    private val _rocket = MutableLiveData<Rocket>()
    val rocket: LiveData<Rocket>
        get() = _rocket

    fun getRocket(id: String) {
        _rocket.postValue(rocketsMock[id.toInt() - 1])
    }
}