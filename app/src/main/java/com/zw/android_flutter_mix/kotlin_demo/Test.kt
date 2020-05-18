package com.zw.android_flutter_mix.kotlin_demo

import io.flutter.embedding.android.FlutterActivity

/**
 * 使用关键字 out 来支持协变，等同于 Java 中的上界通配符 ? extends
 * 使用关键字 in 来支持逆变，等同于 Java 中的下界通配符 ? super
 */
class Test {
    /*

    public static MyNewEngineIntentBuilder withNewEngine(Class<? extends FlutterActivity> activityClass) {
        return new MyNewEngineIntentBuilder(activityClass);
    }

    public static class MyNewEngineIntentBuilder extends NewEngineIntentBuilder {
        public MyNewEngineIntentBuilder(Class<? extends FlutterActivity> activityClass) {
            super(activityClass);
        }
    }

     */
    fun withNewEngine(activityClass: Class<out FlutterActivity?>?): MyNewEngineIntentBuilder? {
        return MyNewEngineIntentBuilder(activityClass)
    }

    class MyNewEngineIntentBuilder(activityClass: Class<out FlutterActivity?>?) :
        FlutterActivity.NewEngineIntentBuilder(activityClass!!)
}