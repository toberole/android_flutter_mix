package com.zw.android_flutter_mix.demo2

import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity

class StudyFlutterActivity : FlutterActivity() {
    companion object {
        val TAG = StudyFlutterActivity::class.java.simpleName
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.i(TAG, "_LifeCyclePageState#onCreate")
    }

    override fun onStart() {
        super.onStart()
        Log.i(TAG, "_LifeCyclePageState#onStart")
    }

    override fun onResume() {
        super.onResume()
        Log.i(TAG, "_LifeCyclePageState#onResume")
    }

    override fun onStop() {
        super.onStop()
        Log.i(TAG, "_LifeCyclePageState#onStop")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.i(TAG, "_LifeCyclePageState#onDestroy")
    }
}
