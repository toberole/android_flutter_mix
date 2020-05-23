package com.zw.android_flutter_mix.kotlin_demo

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.view.View
import com.zw.android_flutter_mix.R
import kotlinx.android.synthetic.main.activity_test_kotlin.*
import kotlinx.coroutines.*

class TestKotlinActivity : AppCompatActivity(), View.OnClickListener {
    var TAG = "TestKotlinActivity-xxx"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_test_kotlin)
        btn_test1.setOnClickListener(this)
    }

    override fun onClick(v: View?) {
        when (v?.id) {
            R.id.btn_test1 -> {
                // test1()
                test2()
            }
        }
    }

    fun test2() {

        GlobalScope.launch(Dispatchers.Main) {
            // 把耗时任务切到子线程去，然后任务执行完之后，再切回主线程继续执行后续的代码。
            var res: String = withContext(Dispatchers.IO) {
                delay(2000)
                println(
                    "threadName = " + Thread.currentThread().name
                            + " threadId = " + Thread.currentThread().id
                )
                "hello"
            }
            println("------------------------------------- $res")
            println(
                "threadName = " + Thread.currentThread().name
                        + " threadId = " + Thread.currentThread().id
            )
        }
    }

    fun test1() {
        //在没有开启协程前，先打印一下进程名称和进程id
        println(
            "Main: " +
                    "threadName = " + Thread.currentThread().name
                    + " threadId = " + Thread.currentThread().id
        )

        //循环20次
        repeat(20) {
            GlobalScope.launch {
                //开启协程后，先打印一下进程名称和进程id
                println(
                    "IO: " +
                            "threadName = " + Thread.currentThread().name
                            + " threadId = " + Thread.currentThread().id
                )
                delay(1000L)
            }
        }

    }
}
