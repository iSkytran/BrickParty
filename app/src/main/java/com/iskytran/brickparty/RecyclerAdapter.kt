package com.iskytran.brickparty

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

/**
 * Class representing the list of events.
 */
class RecyclerAdapter(private val dataSet: ArrayList<String>) : RecyclerView.Adapter<RecyclerAdapter.ViewHolder>() {

    /**
     * Class containing the individual Events.
     */
    inner class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val textView: TextView = view.findViewById(R.id.textView)
    }

    /**
     * Creates ViewHolder object from the layout.
     */
    override fun onCreateViewHolder(viewGroup: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(viewGroup.context).inflate(R.layout.fragment_event_item, viewGroup, false)
        return ViewHolder(view)
    }

    /**
     * Sets the internal data of each Event.
     */
    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.textView.text = dataSet[position]
    }

    /**
     * Gets the number of Events.
     */
    override fun getItemCount(): Int {
        return dataSet.size
    }
}