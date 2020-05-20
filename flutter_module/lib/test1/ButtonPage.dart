import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ButtonPage"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // RaisedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
            RaisedButton(
              child: Text("RaisedButton"),
              onPressed: RaisedButton_onPressed,
            ),
            // FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
            FlatButton(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "FlatButton",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              onPressed: FlatButton_onPressed,
            ),
            OutlineButton(
              child: Text("OutlineButton"),
              onPressed: OutlineButton_onPressed,
            ),
            // IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
            IconButton(
              icon: Icon(
                Icons.thumb_up,
                color: Colors.red,
              ),
              onPressed: IconButton_onPressed,
            ),
            RaisedButton.icon(
                onPressed: null,
                icon: Icon(Icons.send),
                label: Text("带图标的Button")),
            // 定义一个背景蓝色，两边圆角的按钮
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  void RaisedButton_onPressed() {}

  void FlatButton_onPressed() {}

  void OutlineButton_onPressed() {}

  void IconButton_onPressed() {}
}
/*
Flutter 中没有提供去除背景的设置，假若需要去除背景，则可以通过将背景颜色设置为全透明来实现。
const FlatButton({
  ...
  @required this.onPressed, //按钮点击回调
  this.textColor, //按钮文字颜色
  this.disabledTextColor, //按钮禁用时的文字颜色
  this.color, //按钮背景颜色
  this.disabledColor,//按钮禁用时的背景颜色
  this.highlightColor, //按钮按下时的背景颜色
  this.splashColor, //点击时，水波动画中水波的颜色
  this.colorBrightness,//按钮主题，默认是浅色主题
  this.padding, //按钮的填充
  this.shape, //外形
  @required this.child, //按钮的内容
})
 */
