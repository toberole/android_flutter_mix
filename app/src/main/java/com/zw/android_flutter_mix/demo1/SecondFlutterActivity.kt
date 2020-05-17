package com.zw.android_flutter_mix.demo1

import io.flutter.embedding.android.FlutterActivity

class SecondFlutterActivity : FlutterActivity() {
    override fun getInitialRoute(): String {
        return "second_flutter_page"
    }
}
