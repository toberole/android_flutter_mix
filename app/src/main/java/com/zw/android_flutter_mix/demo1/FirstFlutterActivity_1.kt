package com.zw.android_flutter_mix.demo1

import android.os.Bundle
import android.widget.FrameLayout
import androidx.appcompat.app.AppCompatActivity
import com.zw.android_flutter_mix.R
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.view.FlutterMain
import kotlinx.android.synthetic.main.activity_first_flutter.*

/**
 * 不继承FlutterActvity 加载Flutter页面为什么没显示？
 * 该方式不能使用了，直接使用FlutterActiviy
 */
class FirstFlutterActivity_1 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_first_flutter)

        FlutterMain.startInitialization(this)
        FlutterMain.ensureInitializationComplete(this, null)

        var flutterView = FlutterView(this)
        var lp = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
        fl_container.addView(flutterView, lp)

        var flutterEngine = FlutterEngine(this)
        flutterEngine.navigationChannel.setInitialRoute("hello xxxxx *****")
        flutterEngine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        flutterView.attachToFlutterEngine(flutterEngine)
    }
}