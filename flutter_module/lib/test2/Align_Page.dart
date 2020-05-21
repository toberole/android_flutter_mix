import 'package:flutter/material.dart';

// 调整一个子元素在父元素中的位置
// Align 组件可以调整子组件的位置，并且可以根据子组件的宽高来确定自身的的宽高
/*
    Align({
      Key key,
      this.alignment = Alignment.center,
      this.widthFactor,
      this.heightFactor,
      Widget child,
    })

alignment : 需要一个AlignmentGeometry类型的值，表示子组件在父组件中的起始位置。
AlignmentGeometry 是一个抽象类，它有两个常用的子类：Alignment和 FractionalOffset。

widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；
它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。
如果值为null，则组件的宽高将会占用尽可能多的空间。
 */
class Align_Page extends StatefulWidget {
  @override
  _Align_PageState createState() => _Align_PageState();
}

class _Align_PageState extends State<Align_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Align_Page"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.grey,
              child: Align(
                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  )),
            ),
            Container(
              color: Colors.green,
              child: Align(
                widthFactor: 2,
                heightFactor: 2,
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
