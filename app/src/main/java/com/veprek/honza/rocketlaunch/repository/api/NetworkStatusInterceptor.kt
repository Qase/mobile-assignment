package com.veprek.honza.rocketlaunch.repository.api

import com.veprek.honza.rocketlaunch.repository.entity.NoConnectionException
import okhttp3.Interceptor
import okhttp3.Response
import quanti.com.kotlinlog.Log
import javax.inject.Inject

class NetworkStatusInterceptor @Inject constructor(private val connectionManager: ConnectionManager) : Interceptor {
    override fun intercept(chain: Interceptor.Chain): Response {
        return if (connectionManager.isConnected()) {
            Log.d("Connected")
            chain.proceed(chain.request())
        } else {
            Log.d("Not connected")
            throw NoConnectionException()
        }
    }
}
