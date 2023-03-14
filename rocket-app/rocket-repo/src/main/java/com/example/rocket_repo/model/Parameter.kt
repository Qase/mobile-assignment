package com.example.rocket_repo.model

sealed class Parameter(val value: Int, val type: String, val unit: String) {
    class Height(value: Int) : Parameter(value, "height", "m")
    class Diameter(value: Int) : Parameter(value, "diameter", "m")
    class Mass(value: Int) : Parameter(value, "mass", "t")
}
