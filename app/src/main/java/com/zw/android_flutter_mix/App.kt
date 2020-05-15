package com.zw.android_flutter_mix

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class App : Application() {
    lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()
    }

    /**
     * 根据id获取对应的缓存FlutterEngine,，缓存的FlutterEngine打开Flutter页面时，
     * 明显比withNewEngine的引擎打开Flutter页面快，但是 CachedEngineIntentBuilder
     * 没有NewEngineIntentBuilder的initialRoute("")方法。
     */
    private fun cacheFlutterEngine() {
        // Instantiate a FlutterEngine.
        flutterEngine = FlutterEngine(this)

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
            .getInstance()
            .put("app_engine_id", flutterEngine)

    }
}