package com.zw.android_flutter_mix

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import com.zw.android_flutter_mix.demo1.FirstFlutterActivity
import com.zw.android_flutter_mix.demo1.MyFlutterFragmentActivity
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
    }

    override fun onClick(v: View?) {
        when (v?.id) {
            R.id.btn_FirstFlutterActivity -> {
                // 跳转到FirstFlutterActivity
                gotoFirstFlutterPage(FirstFlutterActivity::class.java)
            }
            R.id.btn_FlutterFragment->{
                // 跳转到FlutterFragmentActivity
                var intent = Intent(this@MainActivity, MyFlutterFragmentActivity::class.java)
                this@MainActivity.startActivity(intent)
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
