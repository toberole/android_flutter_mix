package com.zw.android_flutter_mix

import android.app.Application
import io.flutter.view.FlutterMain

class App : Application() {
    override fun onCreate() {
        super.onCreate()
        FlutterMain.startInitialization(this)
    }
}