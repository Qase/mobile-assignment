package com.example.rocket_list.presentation

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.rocket_repo.model.Rocket

class RocketListViewModel : ViewModel() {
    private val _rockets = MutableLiveData<List<Rocket>>()
    val rockets: LiveData<List<Rocket>>
        get() = _rockets

    fun getRockets() {
        _rockets.postValue(com.example.rocket_repo.data.rockets)
    }
}