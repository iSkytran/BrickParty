package com.iskytran.brickparty

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

/**
 * Class representing a page fragment.
 */
class EventsFragment : Fragment() {

    /**
     * Called when the page is created.
     */
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val fragmentView = inflater.inflate(R.layout.fragment_events, container, false)
        val recyclerView: RecyclerView = fragmentView.findViewById(R.id.recyclerView)
        recyclerView.layoutManager = LinearLayoutManager(activity)
        recyclerView.adapter = RecyclerAdapter(TestEvents.items)
        return fragmentView
    }
}