package com.zw.android_flutter_mix.demo1

import android.os.Bundle
import android.widget.FrameLayout
import androidx.appcompat.app.AppCompatActivity
import com.zw.android_flutter_mix.APP_FLUTTER_ENGINE_ID
import com.zw.android_flutter_mix.R
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import kotlinx.android.synthetic.main.activity_first_flutter.*

/**
 * 不继承FlutterActvity 手动处理flutterview flutterengine相关逻辑
 */
class MyFlutterActivity : AppCompatActivity() {
    private var flutterEngine: FlutterEngine? = null
    private lateinit var flutterView: FlutterView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_first_flutter)
        val supportActionBar = supportActionBar
        supportActionBar?.hide()
        flutterView = FlutterView(this)
        var lp = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
        fl_container.addView(flutterView, lp)

        test()
        // testFlutterEngineCache()
    }

    private fun testFlutterEngineCache() {
        flutterEngine = FlutterEngineCache.getInstance().get(APP_FLUTTER_ENGINE_ID)
//        FlutterEngineCache如果已经启动了就无效了,
//        所以此时InitialRoute就只能是默认值"/"或者cache engine时候设置的值
//        flutterEngine!!.navigationChannel.setInitialRoute("hello xxxxx *****")
//        flutterEngine!!.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        flutterView.attachToFlutterEngine(flutterEngine!!)
    }

    private fun test() {
        flutterEngine = FlutterEngine(this)
        flutterEngine!!.navigationChannel.setInitialRoute("MyFlutterActivity")
        flutterEngine!!.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        flutterView.attachToFlutterEngine(flutterEngine!!)
    }

    override fun onResume() {
        super.onResume()
        /**
         * 注意该方法一定要调用
         */
        flutterEngine?.lifecycleChannel?.appIsResumed()
    }


}