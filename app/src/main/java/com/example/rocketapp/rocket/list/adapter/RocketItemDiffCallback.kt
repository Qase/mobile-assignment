package com.example.rocketapp.rocket.list.adapter

import androidx.recyclerview.widget.DiffUtil

class RocketItemDiffCallback: DiffUtil.ItemCallback<RocketItem>() {

    override fun areItemsTheSame(oldItem: RocketItem, newItem: RocketItem): Boolean {
        return oldItem == newItem
    }

    override fun areContentsTheSame(oldItem: RocketItem, newItem: RocketItem): Boolean {
        return areItemsTheSame(oldItem, newItem)
    }
}