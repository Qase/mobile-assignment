package com.example.rocketapp.tools.date

import java.util.*

fun Date.beforeOrEqual(date: Date): Boolean {
    return this == date || this.before(date)
}

fun Date.afterOrEqual(date: Date): Boolean {
    return this == date || this.after(date)
}

fun Date.minusDay(): Date {
    val c = Calendar.getInstance()
    c.time = this
    c.add(Calendar.DATE, -1)
    return c.time
}

fun Date.plusDay(): Date {
    val c = Calendar.getInstance()
    c.time = this
    c.add(Calendar.DATE, 1)
    return c.time
}