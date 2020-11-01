package com.zw.android_flutter_mix.demo1

import android.os.Bundle
import android.util.Log
import android.widget.FrameLayout
import androidx.appcompat.app.AppCompatActivity
import com.zw.android_flutter_mix.R
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.view.FlutterMain
import kotlinx.android.synthetic.main.activity_first_flutter.*

/**
 * 配置入口main.dart 可以通过android studio
 */
class MyFlutterActivity_1 : AppCompatActivity() {
    private lateinit var flutterEngine: FlutterEngine

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_my_flutter_1)
        init()
    }

    private fun init() {
        var flutterView = FlutterView(this)
        var lp = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
        fl_container.addView(flutterView, lp)
//
//        flutterEngine = FlutterEngine(this)
//        flutterEngine!!.navigationChannel.setInitialRoute("MyFlutterActivity_1")
//        var appBundlePath = FlutterMain.findAppBundlePath()
//        DartExecutor.DartEntrypoint("$appBundlePath/test_ep/test_main","test_main")
//        flutterEngine!!.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
//        flutterView.attachToFlutterEngine(flutterEngine!!)
//
//        appBundlePath = FlutterMain.findAppBundlePath()
//        Log.i("appBundlePath", "appBundlePath: $appBundlePath")
    }

    override fun onResume() {
        super.onResume()
        flutterEngine?.lifecycleChannel?.appIsResumed()
    }
}