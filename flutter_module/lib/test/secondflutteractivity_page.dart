import 'package:flutter/material.dart';

class SecondActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "SecondActivityPage",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Second Flutter Activity Page"),
          ),
          body: Text(
            "second flutter activity page",
          ),
        ));
  }
}
