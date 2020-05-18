package com.zw.android_flutter_mix.demo1;

import io.flutter.embedding.android.FlutterActivity;

/**
 * NewEngineIntentBuilder(@NonNull Class<? extends FlutterActivity> activityClass)构造方法
 */
public class ThirdFlutterActivity extends FlutterActivity {
    public static MyNewEngineIntentBuilder withNewEngine(Class<? extends FlutterActivity> activityClass) {
        return new MyNewEngineIntentBuilder(activityClass);
    }

    public static class MyNewEngineIntentBuilder extends NewEngineIntentBuilder {
        public MyNewEngineIntentBuilder(Class<? extends FlutterActivity> activityClass) {
            super(activityClass);
        }
    }


}