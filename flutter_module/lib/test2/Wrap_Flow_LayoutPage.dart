import 'package:flutter/material.dart';

/*

  Wrap({
    Key key,
    this.direction = Axis.horizontal,   //排列方向，默认水平方向排列
    this.alignment = WrapAlignment.start,  //子控件在主轴上的对齐方式
    this.spacing = 0.0,  //主轴上子控件中间的间距
    this.runAlignment = WrapAlignment.start,  //子控件在交叉轴上的对齐方式
    this.runSpacing = 0.0,  //交叉轴上子控件之间的间距
    this.crossAxisAlignment = WrapCrossAlignment.start,   //交叉轴上子控件的对齐方式
    this.textDirection,   //textDirection水平方向上子控件的起始位置
    this.verticalDirection = VerticalDirection.down,  //垂直方向上子控件的其实位置
    List<Widget> children = const <Widget>[],   //要显示的子控件集合
  })

 */
/*
  Row(
      children: <Widget>[
        // error
        // Row和Colum 如果子widget超出屏幕范围，则会报溢出错误
        // 这是因为Row默认只有一行，如果超出屏幕不会折行。我们把超出屏幕显示范围会自动折行的布局称为流式布局。Flutter中通过Wrap和Flow来支持流式布局，将上例中的Row换成Wrap后溢出部分则会自动折行
        // Text("hello world" * 100)
      ],
  )),

 */
class Wrap_Flow_LayoutPage extends StatefulWidget {
  @override
  _Wrap_Flow_LayoutPageState createState() => _Wrap_Flow_LayoutPageState();
}

class _Wrap_Flow_LayoutPageState extends State<Wrap_Flow_LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "",
        home: Scaffold(
          appBar: AppBar(
            title: Text("WrapLayoutPage"),
          ),
          body: Container(
            width: double.infinity,
            color: Colors.grey,
            child: Wrap(
              //排列方向，默认水平方向排列
              direction: Axis.horizontal,
              // 主轴(水平)方向间距
              spacing: 8.0,
              // 纵轴（垂直）方向间距
              runSpacing: 4.0,
              //沿主轴方向居中
              alignment: WrapAlignment.center,
              children: <Widget>[
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('A')),
                  label: new Text('Hamilton'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('M')),
                  label: new Text('Lafayette'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('H')),
                  label: new Text('Mulligan'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('J')),
                  label: new Text('Laurens'),
                ),
              ],
            ),
          ),
        ));
  }
}

class Wrap_Layout extends StatefulWidget {
  @override
  _Wrap_LayoutState createState() => _Wrap_LayoutState();
}

class _Wrap_LayoutState extends State<Wrap_Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 8.0,
        // 主轴(水平)方向间距
        runSpacing: 4.0,
        // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center,
        //沿主轴方向居中
        children: <Widget>[
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('A')),
            label: new Text('Hamilton'),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('M')),
            label: new Text('Lafayette'),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('H')),
            label: new Text('Mulligan'),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('J')),
            label: new Text('Laurens'),
          ),
        ],
      ),
    ));
  }
}
