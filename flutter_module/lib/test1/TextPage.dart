import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  final TapGestureRecognizer _recognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();

    _recognizer.onTap = () {
      print("recognizer.onTap ${this.widget} ......");
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextPage"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "hello world",
                textAlign: TextAlign.center,
                style: TextStyle(backgroundColor: Colors.red),
              ),
              Text(
                "hello world" * 10,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "hello world",
                // 代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性的fontSize，
                // 它是调整字体大小的一个快捷方式。该属性的默认值可以通过MediaQueryData.textScaleFactor获得，
                // 如果没有MediaQuery，那么会默认值将为1.0。
                textScaleFactor: 1.5,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "home"),
                TextSpan(
                    style: TextStyle(color: Colors.red),
                    text: "https://github.com/",
                    recognizer: _recognizer)
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
