import 'package:flutter/material.dart';

/*
当组件内容超过当前显示视口(ViewPort)时，如果没有特殊处理，Flutter则会提示Overflow错误。
为此，Flutter提供了多种可滚动组件（Scrollable Widget）用于显示列表和长布局。
 */

/*
Scrollable({
  ...
  this.axisDirection = AxisDirection.down,
  this.controller,
  this.physics,
  @required this.viewportBuilder, //后面介绍
})
axisDirection滚动方向。
physics：此属性接受一个ScrollPhysics类型的对象，它决定可滚动组件如何响应用户操作，
比如用户滑动完抬起手指后，继续执行动画；或者滑动到边界时，如何显示。
默认情况下，Flutter会根据具体平台分别使用不同的ScrollPhysics对象，应用不同的显示效果，
如当滑动到边界时，继续拖动的话，在iOS上会出现弹性效果，而在Android上会出现微光效果。
如果你想在所有平台下使用同一种效果，可以显式指定一个固定的ScrollPhysics，
Flutter SDK中包含了两个ScrollPhysics的子类，他们可以直接使用：
    ClampingScrollPhysics：Android下微光效果。
    BouncingScrollPhysics：iOS下弹性效果。
controller：此属性接受一个ScrollController对象。ScrollController的主要作用是
控制滚动位置和监听滚动事件。默认情况下，Widget树中会有一个默认的PrimaryScrollController，
如果子树中的可滚动组件没有显式的指定controller，并且primary属性值为true时（默认就为true），
可滚动组件会使用这个默认的PrimaryScrollController。
这种机制带来的好处是父组件可以控制子树中可滚动组件的滚动行为，
例如，Scaffold正是使用这种机制在iOS中实现了点击导航栏回到顶部的功能。

Scrollbar
Scrollbar是一个Material风格的滚动指示器（滚动条），如果要给可滚动组件添加滚动条，
只需将Scrollbar作为可滚动组件的任意一个父级组件即可

 */
class Scrollable_Page extends StatefulWidget {
  @override
  _Scrollable_PageState createState() => _Scrollable_PageState();
}

class _Scrollable_PageState extends State<Scrollable_Page> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
