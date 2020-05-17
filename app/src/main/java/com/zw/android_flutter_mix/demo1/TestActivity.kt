package com.zw.android_flutter_mix.demo1

import android.os.Bundle
import com.zw.android_flutter_mix.R
import io.flutter.app.FlutterActivity

class TestActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_test)
    }
}
