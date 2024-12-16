package com.example.anti_frida
import android.app.ActivityManager
import android.content.Context

object AntiFrida {
    fun isFridaRunning(context: Context): Boolean {
        val activityManager = context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val processes = activityManager.runningAppProcesses

        processes?.let {
            for (process in it) {
                if (process.processName.toLowerCase().contains("frida")) {
                    return true
                }
            }
        }
        return false
    }
}
