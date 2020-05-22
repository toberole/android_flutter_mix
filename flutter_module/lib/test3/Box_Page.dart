import 'package:flutter/material.dart';

/*
尺寸限制类容器用于限制容器大小，Flutter中提供了多种这样的容器，
如ConstrainedBox、BoxConstraints、
SizedBox、UnconstrainedBox、
AspectRatio、FractionallySizedBox等。

比如AspectRatio，它可以指定子组件的长宽比、
LimitedBox 用于指定最大宽高、
FractionallySizedBox 可以根据父容器宽高的百分比来设置子组件宽高等

ConstrainedBox用于对子组件添加额外的约束。例如让子组件的最小高度是80像素，
可以使用const BoxConstraints(minHeight: 80.0)作为子组件的约束。

BoxConstraints 用于设置限制条件
const BoxConstraints({
  this.minWidth = 0.0, //最小宽度
  this.maxWidth = double.infinity, //最大宽度
  this.minHeight = 0.0, //最小高度
  this.maxHeight = double.infinity //最大高度
})

SizedBox 用于给子元素指定固定的宽高
SizedBox(
  width: 80.0,
  height: 80.0,
  child: redBox
)

有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。

UnconstrainedBox
UnconstrainedBox不会对子组件产生任何限制，它允许其子组件按照其本身大小绘制。
在"去除"多重限制的时可以使用。这里所谓的"去除"只是使得外面的约束不直接作用在内部的子组件上了
但是外面的约束本质上还是存在的，在实际开发中，当我们发现已经使用SizedBox或ConstrainedBox给
子元素指定了宽高，但是仍然没有效果时，几乎可以断定：已经有父元素已经设置了限制！
 */
class Box_Page extends StatefulWidget {
  @override
  _Box_PageState createState() => _Box_PageState();
}

class _Box_PageState extends State<Box_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Box_Page"),
        ),
        body: Demo1(),
      ),
    );
  }
}

class Demo1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          minHeight: 50.0 //最小高度为50像素
          ),
      child: Container(
        height: 5,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
        ),
      ),
    );
  }
}
