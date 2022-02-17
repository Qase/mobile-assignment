package com.example.rocketapp.tools.date

import java.text.SimpleDateFormat
import java.util.*


private fun getUiSimpleTimeFormat(): SimpleDateFormat {
    return SimpleDateFormat("dd.MM. yyyy HH:mm:ss", Locale.getDefault())
}

private fun getUiDayFormat(): SimpleDateFormat {
    return SimpleDateFormat("EEEE", Locale.getDefault());
}

private fun getUiSimpleDateFormat(): SimpleDateFormat {
    return SimpleDateFormat("dd.MM. yyyy", Locale.getDefault())
}

fun Date.toUiDate(): String {
    return getUiSimpleDateFormat().format(this)
}

fun Date.toUiTime(): String {
    return getUiSimpleTimeFormat().format(this)
}

fun Date.toUiDay(): String {
    return getUiDayFormat().format(this)
        .replaceFirstChar {
            if (it.isLowerCase()) {
                it.titlecase(Locale.getDefault())
            } else {
                it.toString()
            }
        }
}

fun Date.toMidnight(): Date {
    return toMidnightCalendar().run {
        Date(timeInMillis)
    }
}

fun Date.toMidnightCalendar(): Calendar {
    return Calendar.getInstance().also {
        it.time = this
        it.apply {
            set(Calendar.HOUR_OF_DAY, 0)
            set(Calendar.MINUTE, 0)
            set(Calendar.SECOND, 0)
            set(Calendar.MILLISECOND, 0)
        }
    }
}

