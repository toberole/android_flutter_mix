package com.zw.android_flutter_mix.demo1

import io.flutter.embedding.android.FlutterActivity

fun withNewEngine(activityClass: Class<out FlutterActivity?>?): BaseFlutterActivity.MyNewEngineIntentBuilder? {
    return BaseFlutterActivity.MyNewEngineIntentBuilder(activityClass)
}

open class BaseFlutterActivity : FlutterActivity() {
    class MyNewEngineIntentBuilder(activityClass: Class<out FlutterActivity?>?) :
        NewEngineIntentBuilder(activityClass!!)
}