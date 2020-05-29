import 'package:flutter/material.dart';
import 'package:fluttermodule/base/extension_test.dart';

class extension_page extends StatefulWidget {
  @override
  _extension_pageState createState() => _extension_pageState();
}

class _extension_pageState extends State<extension_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "extension_page",
      home: Scaffold(
        appBar: AppBar(
          title: Text("extension_page"),
        ),
        body: Text(
          "extension",
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ).intoContainer(
            width: double.infinity,
            color: Colors.grey,
            height: 50,
            alignment: Alignment.center),
      ),
    );
  }
}
