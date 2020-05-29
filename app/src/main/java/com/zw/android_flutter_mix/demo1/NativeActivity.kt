package com.zw.android_flutter_mix.demo1

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.zw.android_flutter_mix.R
import java.util.concurrent.ConcurrentLinkedQueue

class NativeActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_native)
        Toast.makeText(this, "NativeActivity", Toast.LENGTH_SHORT).show()

        test()
    }

    fun test(){
        var queue = ConcurrentLinkedQueue<String>()

    }
}
