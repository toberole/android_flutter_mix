import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MT_Page extends StatefulWidget {
  @override
  _MT_PageState createState() => _MT_PageState();
}

class _MT_PageState extends State<MT_Page> {
  static const String METHOD_CHANNEL = "com.android.mt";
  static const String METHOD_UPDATE_RES = "method_update_res";
  static const String METHOD_START = "method_start";
  static const String METHOD_STOP = "method_stop";

  ScrollController scrollController = ScrollController();

  StringBuffer res = StringBuffer();

  MethodChannel methodChannel;

  void _start() async {
    methodChannel.invokeListMethod(METHOD_START);
  }

  void _scrollToend() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void _stop() {
    methodChannel.invokeListMethod(METHOD_STOP);
  }

  @override
  void initState() {
    super.initState();

    methodChannel = MethodChannel(METHOD_CHANNEL);
    methodChannel.setMethodCallHandler((call) async {
      if (call.method.compareTo(METHOD_UPDATE_RES) == 0) {
        setState(() {
          res.write(call.arguments + "\n");
        });

        Future.delayed(Duration(milliseconds: 500), () {
          _scrollToend();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey),
      title: "机器翻译",
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("机器翻译"),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: _start,
                  child: Text(
                    "start",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: _stop,
                  child: Text(
                    "stop",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Text("${res.toString()}"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
