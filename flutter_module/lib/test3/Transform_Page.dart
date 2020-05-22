import 'package:flutter/material.dart';

/*
Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效
 */
class Transform_Page extends StatefulWidget {
  @override
  _Transform_PageState createState() => _Transform_PageState();
}

class _Transform_PageState extends State<Transform_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: new Transform(
            alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
            transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
            child: new Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.deepOrange,
              child: const Text('Apartment for rent!'),
            ),
          ),
        ),
      ),
    );
  }
}
