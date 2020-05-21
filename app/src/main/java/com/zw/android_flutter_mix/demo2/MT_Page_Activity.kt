package com.zw.android_flutter_mix.demo2

import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.*

class MT_Page_Activity : FlutterActivity() {
    private lateinit var methodChannel: MethodChannel

    companion object {
        val TAG = MT_Page_Activity::class.java.simpleName

        val METHOD_CHANNEL = "com.android.mt"
        val METHOD_UPDATE_RES = "method_update_res"
        val METHOD_START = "method_start"
        val METHOD_STOP = "method_stop"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        initMethodChannel()
    }

    private fun initMethodChannel() {
        methodChannel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, METHOD_CHANNEL)
        methodChannel.setMethodCallHandler(object : MethodChannel.MethodCallHandler {
            override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
                if (call.method.equals(METHOD_START)) {
                    test_start()
                } else if (call.method.equals(METHOD_STOP)) {
                    test_stop()
                }
            }
        })
    }

    fun test_start() {
        Log.i(TAG, "test_start .......")
        GlobalScope.launch(Dispatchers.IO) {
            for (i in 1..100) {
                delay(1000)
                var mt_res =
                    "hello world hello world hello world hello world hello world hello world hello world hello world $i"
                withContext(Dispatchers.Main) {
                    methodChannel.invokeMethod(METHOD_UPDATE_RES, mt_res)
                }
            }
        }
    }

    fun test_stop() {
        Log.i(TAG, "test_stop .......")
    }
}