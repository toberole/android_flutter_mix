import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class OpenNativieActivity extends StatefulWidget {
  @override
  _OpenNativieActivityState createState() => _OpenNativieActivityState();
}

class _OpenNativieActivityState extends State<OpenNativieActivity> {
  static const method_channel_name =
      "com.zw.android_flutter_mix.demo1.FirstFlutterActivity.Channel";
  MethodChannel methodChannel;

  @override
  void initState() {
    super.initState();
    print("xxxxx initState");
    methodChannel = MethodChannel(method_channel_name);
  }

  @override
  void didUpdateWidget(OpenNativieActivity oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("xxxxx didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("xxxxx deactivate");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
          appBar: AppBar(
            title: Text("First Flutter Page"),
          ),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: openNativeActivity_,
                      child: Text("open native activity"),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: openSecondFlutterActivity_,
                      child: Text("open second flutter activity"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  void openNativeActivity_() async {
    String res =
        await methodChannel.invokeMethod("startNativeActivity", [1, 2, 3]);
    print("xxxxx openNativeActivity_ res = $res");
  }

  void openSecondFlutterActivity_() async {
    String res = await methodChannel
        .invokeMethod("openSecondFlutterActivity_", {"data": "aaaaaaaa"});
    print("xxxxx openSecondFlutterActivity_ res = $res");
  }
}
