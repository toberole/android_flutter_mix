import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LayoutTest extends StatefulWidget {
  @override
  _LayoutTestState createState() => _LayoutTestState();
}

class _LayoutTestState extends State<LayoutTest> {
  String method_channel_name = "com.android.go";

  MethodChannel methodChannel;

  int groupValue = 1;

  String ip;

  String port;

  @override
  void initState() {
    super.initState();
    methodChannel = MethodChannel(method_channel_name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "虚拟主播",
        home: Scaffold(
          appBar: AppBar(
              title: Center(
            child: Text(
              "虚拟主播",
              textAlign: TextAlign.center,
            ),
          )),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Radio(
                          groupValue: groupValue,
                          value: 1,
                          onChanged: (v) {
                            onChanged(v);
                          },
                        ),
                        Text("480P")
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Radio(
                          groupValue: groupValue,
                          value: 2,
                          onChanged: (v) {
                            onChanged(v);
                          },
                        ),
                        Text("540P")
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Radio(
                          groupValue: groupValue,
                          value: 3,
                          onChanged: (v) {
                            onChanged(v);
                          },
                        ),
                        Text("720P")
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Radio(
                          groupValue: groupValue,
                          value: 4,
                          onChanged: (v) {
                            onChanged(v);
                          },
                        ),
                        Text("1080P")
                      ],
                    ),
                  )
                ],
              ),
              TextField(
                onChanged: (v) {
                  inputIP(v);
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: "IP"),
              ),
              TextField(
                onChanged: (v) {
                  inputPort(v);
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: "Port"),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(20),
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      onPressed: btn_go,
                      child: Text("go--->"),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onChanged(v) {
    setState(() {
      groupValue = v;
    });
  }

  void inputIP(String v) {
    ip = v;
  }

  void inputPort(String v) {
    port = v;
  }

  void btn_go() async {
    methodChannel
        .invokeMethod("go", {"ip": ip, "port": port, "size": groupValue});
  }
}
