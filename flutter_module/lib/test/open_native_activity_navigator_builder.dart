import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermodule/test/flutter_page.dart';
import 'package:fluttermodule/test/flutter_navigator_page1.dart';

class OpenNativieActivity extends StatefulWidget {
  @override
  _OpenNativieActivityState createState() => _OpenNativieActivityState();
}

class _OpenNativieActivityState extends State<OpenNativieActivity> {
  @override
  void initState() {
    super.initState();
    print("xxxxx initState");
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
        // typedef WidgetBuilder = Widget Function(BuildContext context)
        routes: <String, WidgetBuilder>{
          "/flutter_apge1": (context) => new FlutterPage1(),
          "/flutter_apge2": (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text("aaaaaa"),
              ),
              body: Text("路由Page"),
            );
          }
        },
        // builder 模式也可以处理navigator无效
        // https://juejin.im/post/5c665cb651882562914ec153
        home: PageXXX());
  }
}

// https://juejin.im/post/5c665cb651882562914ec153
class PageXXX extends StatelessWidget {
  static const method_channel_name =
      "com.zw.android_flutter_mix.demo1.FirstFlutterActivity.Channel";
  MethodChannel methodChannel;

  @override
  Widget build(BuildContext context) {
    if (methodChannel == null) {
      methodChannel = MethodChannel(method_channel_name);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("First Flutter Page"),
      ),
      body: Column(
        children: <Widget>[
          Builder(
            builder: (context) {
              return Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("builder 模式"),
                    ),
                  )
                ],
              );
            },
          ),
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
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () => {goFlutterPage(context)},
                  child: Text("go flutter page"),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () => {goFlutterPage111(context)},
                  child: Text("go flutter page 111"),
                ),
              )
            ],
          ),
        ],
      ),
    );
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

  goFlutterPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => FlutterPage()));
  }

  goFlutterPage111(BuildContext context) {
    Navigator.pushNamed(context, "/flutter_apge1");
  }
}
