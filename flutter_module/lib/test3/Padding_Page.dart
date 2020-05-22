import 'package:flutter/material.dart';

/*

Padding({
  ...
  EdgeInsetsGeometry padding,
  Widget child,
})
EdgeInsetsGeometry是一个抽象类，开发中一般都使用EdgeInsets类，它是EdgeInsetsGeometry的一个子类

EdgeInsets
fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的填充。
all(double value) : 所有方向均使用相同数值的填充。
only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
symmetric({ vertical, horizontal })：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right。

 */
class Padding_Page extends StatefulWidget {
  @override
  _Padding_PageState createState() => _Padding_PageState();
}

class _Padding_PageState extends State<Padding_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Padding_Page",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Padding_Page"),
          ),
          body: Container(
            color: Colors.grey,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  //width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 40, 50, 60),
                    child: Text(
                      "padding test",
                      style: TextStyle(backgroundColor: Colors.green),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
