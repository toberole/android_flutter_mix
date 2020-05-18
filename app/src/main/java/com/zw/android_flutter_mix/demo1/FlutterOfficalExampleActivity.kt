package com.zw.android_flutter_mix.demo1

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.zw.android_flutter_mix.R
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import java.util.*

class FlutterOfficalExampleActivity : AppCompatActivity() {
    private var flutterEngine: FlutterEngine? = null
    private var flutterView: FlutterView? = null

    private var counter = 0

    private val CHANNEL = "increment"
    private val EMPTY_MESSAGE = ""
    private val PING = "ping"
    private var messageChannel: BasicMessageChannel<String>? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val args = getArgsFromIntent(intent)
        if (flutterEngine == null) {
            flutterEngine = FlutterEngine(this, args)
            flutterEngine!!.dartExecutor.executeDartEntrypoint(
                DartEntrypoint.createDefault()
            )
        }
        setContentView(R.layout.activity_flutter_offical_example)

        val supportActionBar = supportActionBar
        supportActionBar?.hide()

        val fab: Button = findViewById(R.id.button)
        fab.setOnClickListener(View.OnClickListener { sendAndroidIncrement() })

        flutterView = findViewById(R.id.flutter_view)
        flutterView!!.attachToFlutterEngine(flutterEngine!!)

        initChannel()
      }

    override fun onResume() {
        super.onResume()
        flutterEngine!!.lifecycleChannel.appIsResumed()
    }

    private fun sendAndroidIncrement() {
        messageChannel!!.send(PING)
    }

    private fun onFlutterIncrement() {
        counter++
        val textView =
            findViewById<TextView>(R.id.button_tap)
        val value =
            "Flutter button tapped " + counter + if (counter == 1) " time" else " times"
        textView.text = value
    }


    override fun onPause() {
        super.onPause()
        flutterEngine!!.lifecycleChannel.appIsInactive()
    }

    override fun onStop() {
        super.onStop()
        flutterEngine!!.lifecycleChannel.appIsPaused()
    }

    override fun onDestroy() {
        flutterView!!.detachFromFlutterEngine()
        super.onDestroy()
    }

    private fun getArgsFromIntent(intent: Intent): Array<String?>? {
        // Before adding more entries to this list, consider that arbitrary
        // Android applications can generate intents with extra data and that
        // there are many security-sensitive args in the binary.
        val args = ArrayList<String>()
        if (intent.getBooleanExtra("trace-startup", false)) {
            args.add("--trace-startup")
        }
        if (intent.getBooleanExtra("start-paused", false)) {
            args.add("--start-paused")
        }
        if (intent.getBooleanExtra("enable-dart-profiling", false)) {
            args.add("--enable-dart-profiling")
        }
        if (!args.isEmpty()) {
            val argsArray = arrayOfNulls<String>(args.size)
            return args.toArray(argsArray)
        }
        return null
    }

    private fun initChannel() {
        messageChannel = BasicMessageChannel(
            flutterEngine!!.dartExecutor,
            CHANNEL,
            StringCodec.INSTANCE
        )
        messageChannel!!.setMessageHandler { s, reply ->
            onFlutterIncrement()
            reply.reply(EMPTY_MESSAGE)
        }
    }
}
