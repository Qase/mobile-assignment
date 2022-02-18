package com.example.rocketapp.rocket.list.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.rocketapp.databinding.RowRocketItemBinding
import com.example.rocketapp.rocket.repository.model.Rocket
import com.example.rocketapp.tools.date.toUiDate

class RocketListAdapter(
    private val context: Context,
    diffCallback: DiffUtil.ItemCallback<RocketItem> = RocketItemDiffCallback()
): ListAdapter<RocketItem, RocketListViewHolder>(diffCallback) {

    private var itemClickListener: ((Int, RocketItem) -> Unit)? = null

    fun setOnItemClickListener(f : (Int, RocketItem) -> Unit) {
        itemClickListener = f
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RocketListViewHolder {
        val layoutInflater = LayoutInflater.from(context)
        val binding = RowRocketItemBinding.inflate(layoutInflater, parent, false)
        return RocketListViewHolder(binding)
    }

    override fun onBindViewHolder(holder: RocketListViewHolder, position: Int) {
        val item = getItem(position)
        holder.apply {
            itemClickListener?.let {
                mainView.setOnClickListener { _ ->
                    val currentPosition = holder.adapterPosition
                    if (currentPosition != RecyclerView.NO_POSITION) {
                        val selectedItem = getItem(currentPosition)
                        it(currentPosition, selectedItem)
                    }
                }
            }
            txtRocketName.text = item.name
            txtFirstStart.text = item.firstFlight.toUiDate()
        }
    }
}