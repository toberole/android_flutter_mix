import 'package:flutter/material.dart';
import 'package:fluttermodule/test/flutter_page2.dart';

class FlutterPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 取消返回箭头
        automaticallyImplyLeading: false,
        title: Text("FlutterPage 1"),
      ),
      // Builder模式处理navigator无效
      body: Builder(builder: (context) {
        return RaisedButton(
          child: Text("Builder模式处理navigator无效"),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FlutterPage2()));
          },
        );
      }),
    );
  }
}
