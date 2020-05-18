package com.zw.android_flutter_mix

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import com.zw.android_flutter_mix.demo1.FirstFlutterActivity
import com.zw.android_flutter_mix.demo1.FlutterOfficalExampleActivity
import com.zw.android_flutter_mix.demo1.MyFlutterActivity
import com.zw.android_flutter_mix.demo1.MyFlutterFragmentActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
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
        btn_FirstFlutterActivity.setOnClickListener(this)
        btn_FlutterFragment.setOnClickListener(this)
        btn_FlutterOfficalExampleActivity.setOnClickListener(this)
        btn_MyFlutterActivity.setOnClickListener(this)
        btn_srartFlutterActivity.setOnClickListener(this)
    }

    override fun onClick(v: View?) {
        when (v?.id) {
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
                var intent = Intent(this@MainActivity, MyFlutterActivity::class.java)
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
                var intent = Intent(this,FlutterActivity::class.java)
                startActivity(intent)
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
