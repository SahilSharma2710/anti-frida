package com.example.anti_frida

import io.flutter.embedding.android.FlutterActivity
import com.example.anti_frida.AntiFrida
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.app.ActivityManager
import android.content.Context

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.anti_frida"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "detectFrida") {
                    println("Hello, World!")
                    val isFridaRunning = AntiFrida.isFridaRunning(this)
                    result.success(isFridaRunning)
                } else {
                    println("Hello, !")
                    result.notImplemented()
                }
            }
    }
    }
