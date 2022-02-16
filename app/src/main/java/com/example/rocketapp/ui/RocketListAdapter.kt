package com.example.rocketapp.ui

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.rocketapp.databinding.RowRocketItemBinding
import com.example.rocketapp.services.model.rocket.RocketDto
import com.example.rocketapp.ui.adapter.RocketListViewHolder

class RocketListAdapter(
    private val context: Context
    ): RecyclerView.Adapter<RocketListViewHolder>() {

    private val list = mutableListOf<RocketDto>()

    fun updateList(newList: List<RocketDto>) {
        list.clear()
        list.addAll(newList)
        notifyDataSetChanged()
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RocketListViewHolder {
        val layoutInflater = LayoutInflater.from(context)
        val binding = RowRocketItemBinding.inflate(layoutInflater, parent, false)
        return RocketListViewHolder(binding)
    }

    override fun onBindViewHolder(holder: RocketListViewHolder, position: Int) {
        val item = list[position]
        holder.apply {
            txtRocketName.text = item.name
            txtFirstStart.text =
        }
    }

    override fun getItemCount(): Int {
        return list.size
    }
}