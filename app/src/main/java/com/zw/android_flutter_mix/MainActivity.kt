package com.zw.android_flutter_mix

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import com.zw.android_flutter_mix.demo1.FirstFlutterActivity
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
    }


    override fun onClick(v: View?) {
        when (v?.id) {
            R.id.btn_FirstFlutterActivity -> {
                // 跳转到FirstFlutterActivity
                gotoFirstFlutterPage(FirstFlutterActivity::class.java)
            }
        }
    }

    private fun gotoFirstFlutterPage(page: Class<FirstFlutterActivity>) {
        var intent = Intent(this@MainActivity, page)
        intent.putExtra("route", "hello route")
        this@MainActivity.startActivity(intent)
    }
}
