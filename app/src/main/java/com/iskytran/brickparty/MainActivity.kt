package com.iskytran.brickparty

import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter
import androidx.viewpager2.widget.ViewPager2

private const val NUM_PAGES = 3

/**
 * Main class called at runtime.
 */
class MainActivity : FragmentActivity() {

    /**
     * Variable to hold the viewPager.
     */
    private lateinit var viewPager: ViewPager2

    /**
     * Called when app is created.
     */
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Get the viewPager.
        viewPager = findViewById<ViewPager2>(R.id.pager)

        // Create a new PageAdapter object and assign it to the viewPager.
        val pagerAdapter = PageAdapter(this)
        viewPager.adapter = pagerAdapter
    }

    /**
     * Function called to set the current page item when pressing the back button.
     */
    override fun onBackPressed() {
        if (viewPager.currentItem == 0) {
            super.onBackPressed()
        } else {
            viewPager.currentItem = viewPager.currentItem - 1
        }
    }

    /**
     * Class to get the page fragment.
     */
    private inner class PageAdapter(fa: FragmentActivity) : FragmentStateAdapter(fa) {
        /**
         * Get the number of pages.
         */
        override fun getItemCount(): Int = NUM_PAGES

        /**
         * Creates a fragment for the current page.
         */
        override fun createFragment(position: Int): Fragment = PageFragment()
    }
}
