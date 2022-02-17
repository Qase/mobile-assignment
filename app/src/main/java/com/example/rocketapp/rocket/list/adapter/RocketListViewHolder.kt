package com.example.rocketapp.rocket.list.adapter

import androidx.recyclerview.widget.RecyclerView
import com.example.rocketapp.databinding.RowRocketItemBinding

class RocketListViewHolder(binding: RowRocketItemBinding) : RecyclerView.ViewHolder(binding.root) {
    val txtRocketName = binding.txtRocketName
    val txtFirstStart = binding.txtFirstStart
}