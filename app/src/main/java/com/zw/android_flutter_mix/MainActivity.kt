package com.zw.android_flutter_mix

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import com.zw.android_flutter_mix.demo1.*
import com.zw.android_flutter_mix.demo2.MT_Page_Activity
import com.zw.android_flutter_mix.demo2.StudyFlutterActivity
import com.zw.android_flutter_mix.demo3.LaunchActivity
import com.zw.android_flutter_mix.kotlin_demo.TestKotlinActivity
import io.flutter.embedding.android.FlutterActivity
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), View.OnClickListener {
    external fun stringFromJNI(): String

    companion object {
        init {
            System.loadLibrary("native-lib")
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        btn_LaunchActivity.setOnClickListener(this)
        btn_FirstFlutterActivity.setOnClickListener(this)
        btn_FlutterFragment.setOnClickListener(this)
        btn_FlutterOfficalExampleActivity.setOnClickListener(this)
        btn_MyFlutterActivity.setOnClickListener(this)
        btn_srartFlutterActivity.setOnClickListener(this)
        btn_ThirdFlutterActivity.setOnClickListener(this)
        btn_Test.setOnClickListener(this)
        btn_flutter.setOnClickListener(this)
        btn_MT_Page_Activity.setOnClickListener(this)
        btn_TestKotlinActivity.setOnClickListener(this)

        btn_MyFlutterActivity1.setOnClickListener(this)

    }

    override fun onClick(v: View?) {
        when (v?.id) {
            R.id.btn_LaunchActivity -> {
                var i = Intent(this, LaunchActivity::class.java)
                startActivity(i)
            }
            R.id.btn_FirstFlutterActivity -> {
                // 跳转到 FirstFlutterActivity
                gotoFirstFlutterPage(FirstFlutterActivity::class.java)
            }

            R.id.btn_FlutterFragment -> {
                // 跳转到 FlutterFragmentActivity
                var intent = Intent(this@MainActivity, MyFlutterFragmentActivity::class.java)
                this@MainActivity.startActivity(intent)
            }

            R.id.btn_FlutterOfficalExampleActivity -> {
                // 跳转到 FlutterOfficalExampleActivity
                var intent = Intent(this@MainActivity, FlutterOfficalExampleActivity::class.java)
                this@MainActivity.startActivity(intent)
            }

            R.id.btn_MyFlutterActivity -> {
                // 跳转到 MyFlutterActivity
                var intent = Intent(this@MainActivity, MyFlutterActivity_2::class.java)
                this@MainActivity.startActivity(intent)
            }

            R.id.btn_MyFlutterActivity1 -> {
                // 跳转到 MyFlutterActivity
                var intent = Intent(this@MainActivity, MyFlutterActivity_1::class.java)
                this@MainActivity.startActivity(intent)
            }

            R.id.btn_srartFlutterActivity -> {
                // 启动FlutterActivity
                // 需要在manifest中注册io.flutter.embedding.android.FlutterActivity
                // 通过intent传入一些参数
                // 方式一传递参数
//                var intent = FlutterActivity.withNewEngine()
//                    .initialRoute("直接启动FlutterActivity")
//                    .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.opaque)
//                    .build(this@MainActivity)
//                startActivity(intent)

                // 方式二直接在manifest中配置
                var intent = Intent(this, FlutterActivity::class.java)
                startActivity(intent)
            }

            R.id.btn_flutter -> {
                var intent = Intent(this, StudyFlutterActivity::class.java)
                intent.putExtra("route", "/StudyFlutterActivity")
                startActivity(intent)
            }

            R.id.btn_MT_Page_Activity -> {
                var intent = Intent(this, MT_Page_Activity::class.java)
                intent.putExtra("route", "/MT_Page_Activity")
                startActivity(intent)
            }

            /**
             * 使用withNewEngine打开继承自FlutterActivity的 传递参数
             */
            R.id.btn_ThirdFlutterActivity -> {
                // 跳转到 ThirdFlutterActivity
                var intent = ThirdFlutterActivity
                    .withNewEngine(ThirdFlutterActivity::class.java)
                    .initialRoute("ThirdFlutterActivity").build(this)
                startActivity(intent)
            }

            R.id.btn_Test -> {
                var intent =
                    withNewEngine(TestFlutterActivity::class.java)?.initialRoute("TestFlutterActivity")
                        ?.build(this)
                startActivity(intent)
            }

            R.id.btn_TestKotlinActivity -> {
                var i = Intent(this@MainActivity, TestKotlinActivity::class.java)
                startActivity(i)
            }

        }
    }

    private fun gotoFirstFlutterPage(page: Class<FirstFlutterActivity>) {
        var intent = Intent(this@MainActivity, page)
        // 启动FlutterActivity传递值
        intent.putExtra("data", "hello FirstFlutterActivity")
        this@MainActivity.startActivity(intent)
    }
}
