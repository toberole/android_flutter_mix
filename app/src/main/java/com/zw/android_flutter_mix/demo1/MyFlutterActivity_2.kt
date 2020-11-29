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
import kotlinx.android.synthetic.main.activity_my_flutter_2.*

/**
 * 配置入口main.dart 可以通过android studio
 */
class MyFlutterActivity_2 : AppCompatActivity() {
    private lateinit var flutterEngine: FlutterEngine

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_my_flutter_2)

        init()
    }

    private fun init(){
        flutterEngine = FlutterEngine(this)
        flutterEngine!!.navigationChannel.setInitialRoute("MyFlutterActivity2")
        flutterEngine!!.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        flutterView.attachToFlutterEngine(flutterEngine!!)
    }

    override fun onResume() {
        super.onResume()
        flutterEngine?.lifecycleChannel?.appIsResumed()
    }
}