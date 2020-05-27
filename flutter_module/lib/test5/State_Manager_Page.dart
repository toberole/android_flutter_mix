import 'package:flutter/material.dart';
import 'package:fluttermodule/test5/Counter.dart';
import 'package:provide/provide.dart';

class State_Manager_Page extends StatefulWidget {
  @override
  _State_Manager_PageState createState() => _State_Manager_PageState();
}

class _State_Manager_PageState extends State<State_Manager_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "State_Manager",
      home: Scaffold(
        appBar: AppBar(
          title: Text("State_Manager"),
        ),
        body: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.grey,
              width: double.infinity,
              child: Provide<Counter>(
                builder: (context, child, counter) {
                  return Text(
                    "${counter.value}",
                    textAlign: TextAlign.center,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
