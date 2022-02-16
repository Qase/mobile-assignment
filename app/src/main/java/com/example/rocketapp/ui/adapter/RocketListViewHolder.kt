package com.example.rocketapp.ui.adapter

import android.view.View
import androidx.recyclerview.widget.RecyclerView
import com.example.rocketapp.databinding.RowRocketItemBinding

class RocketListViewHolder(binding: RowRocketItemBinding) : RecyclerView.ViewHolder(binding.root) {
    val txtRocketName = binding.txtRocketName
    val txtFirstStart = binding.txtFirstStart
}