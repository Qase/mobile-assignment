package com.example.rocketapp.tools

/**
 * Zdroj https://github.com/bijukunjummen/kfun
 */

sealed class Try<out T> {

    companion object {

        operator fun <T> invoke(body: () -> T): Try<T> {
            return try {
                Success(body())
            } catch (e: Exception) {
                Failure(e)
            }
        }

        suspend fun <T> invokeCoroutines(body: suspend () -> T): Try<T> {
            return try {
                Success(body())
            } catch (e: Exception) {
                Failure(e)
            }
        }
    }

    abstract fun toResult(): Result<T>

    abstract fun isSuccess(): Boolean

    abstract fun isFailure(): Boolean

    fun <U> map(f: (T) -> U): Try<U> {
        return when (this) {
            is Success -> Try {
                f(this.value)
            }
            is Failure -> this
        }
    }

    suspend fun <U> mapSuspend(f: suspend (T) -> U): Try<U> {
        return when (this) {
            is Success -> {
                val result = f(this.value)
                Success(result)
            }
            is Failure -> this
        }
    }

    fun <U> flatMap(f: (T) -> Try<U>): Try<U> {
        return when (this) {
            is Success -> f(this.value)
            is Failure -> this
        }
    }

    abstract fun get(): T

}

data class Success<out T>(val value: T) : Try<T>() {
    override fun toResult(): Result<T> = Result.success(value)
    override fun isSuccess(): Boolean = true
    override fun isFailure(): Boolean = false
    override fun get() = value
}

data class Failure(val e: Throwable) : Try<Nothing>() {
    override fun toResult(): Result<Nothing> = Result.failure(e)
    override fun isSuccess(): Boolean = false
    override fun isFailure(): Boolean = true
    override fun get(): Nothing = throw e
}