package com.zw.android_flutter_mix.demo1

import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import androidx.fragment.app.FragmentManager
import com.zw.android_flutter_mix.R
import io.flutter.embedding.android.FlutterFragment

class MyFlutterFragmentActivity : FragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_flutter_fragment)

        var fragmentManager: FragmentManager = supportFragmentManager
        //默认路由,相当于:initialRoute("/")
        //FlutterFragment flutterFragment = FlutterFragment.createDefault();

        //FlutterFragment flutterFragment = FlutterFragment.createDefault();
//        var flutterFragment = FlutterFragment.withNewEngine()
//            .initialRoute("/FlutterFragmentPage") //设置路由
//            .build<FlutterFragment>()

        var flutterFragment = FlutterFragment
            .NewEngineFragmentBuilder()
            .initialRoute("/FlutterFragmentPage")
            .build<FlutterFragment>()
        fragmentManager
            .beginTransaction()
            .add(R.id.fl_container, flutterFragment, "flutter_fragment")
            .commit()
    }
}
