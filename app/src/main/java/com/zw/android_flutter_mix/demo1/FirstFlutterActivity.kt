package com.zw.android_flutter_mix.demo1

import android.content.Intent
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterSurfaceView
import io.flutter.embedding.android.FlutterTextureView
import io.flutter.embedding.android.SplashScreen
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * Activity 加载Flutter页面
 * FlutterActivity封装了相关加载flutter页面的逻辑
 */
class FirstFlutterActivity : FlutterActivity() {
    companion object {
        val TAG = FirstFlutterActivity::class.java.simpleName

        val method_channel_name = "com.zw.android_flutter_mix.demo1.FirstFlutterActivity.Channel"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        initMethodChannel()
    }

//    override fun provideSplashScreen(): SplashScreen? {
//        return null
//    }

    private fun initMethodChannel() {
        var methodChannel =
            MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, method_channel_name)
        methodChannel.setMethodCallHandler(object : MethodChannel.MethodCallHandler {
            override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
                Log.i(TAG, "xxxxx onMethodCall thread name: ${Thread.currentThread().name}")
                Log.i(TAG, "xxxxx method: ${call.method}")

                if (call.method.contentEquals("startNativeActivity")) {

                    var intent = Intent(this@FirstFlutterActivity, NativeActivity::class.java)
                    this@FirstFlutterActivity.startActivity(intent)

                    result.success("success")
                } else if (call.method.contentEquals("openSecondFlutterActivity_")) {

                    var intent =
                        Intent(this@FirstFlutterActivity, SecondFlutterActivity::class.java)
                    this@FirstFlutterActivity.startActivity(intent)

                    result.success("success")
                }
            }
        })
    }


    override fun getInitialRoute(): String {
        var intent: Intent? = intent
        var data: String? = intent?.getStringExtra("data")
        Log.i(TAG, "data: $data " + System.currentTimeMillis())
        return data + "first_flutter_activity_page"
    }

    override fun onFlutterTextureViewCreated(flutterTextureView: FlutterTextureView) {
        super.onFlutterTextureViewCreated(flutterTextureView)
        Log.i(TAG, "onFlutterTextureViewCreated ..." + System.currentTimeMillis())
    }

    override fun onFlutterSurfaceViewCreated(flutterSurfaceView: FlutterSurfaceView) {
        super.onFlutterSurfaceViewCreated(flutterSurfaceView)
        Log.i(TAG, "onFlutterSurfaceViewCreated ..." + System.currentTimeMillis())
    }
}