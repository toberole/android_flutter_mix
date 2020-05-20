import 'package:flutter/material.dart';

/*
Material 组件库中提供了两种进度指示器：LinearProgressIndicator和CircularProgressIndicator，
它们都可以同时用于精确的进度指示和模糊的进度指示。精确进度通常用于任务进度可以计算和预估的情况，
比如文件下载；而模糊进度则用户任务进度无法准确获得的情况，如下拉刷新，数据提交等。

LinearProgressIndicator({
  double value,
  Color backgroundColor,
  Animation<Color> valueColor,
  ...
})
value：value表示当前的进度，取值范围为[0,1]；如果value为null时则指示器会执行一个循环动画（模糊进度）；当value不为null时，指示器为一个具体进度的进度条。
backgroundColor：指示器的背景色。
valueColor: 指示器的进度条颜色；值得注意的是，该值类型是Animation<Color>，这允许我们对进度条的颜色也可以指定动画。如果我们不需要对进度条颜色执行动画，换言之，我们想对进度条应用一种固定的颜色，此时我们可以通过AlwaysStoppedAnimation来指定。

 */

// flutter_spinkit 开源的进度条组件

class Progress_Page extends StatefulWidget {
  @override
  _Progress_PageState createState() => _Progress_PageState();
}

class _Progress_PageState extends State<Progress_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Progress_Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 模糊进度条(会执行一个动画)
            LinearProgressIndicator(
              backgroundColor: Colors.red,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            SizedBox(height: 20),
            //进度条显示50%
            LinearProgressIndicator(
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.grey),
              value: .5,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              strokeWidth: 10,
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
            SizedBox(height: 20),
            // 自定义尺寸
            /**
             * LinearProgressIndicator和CircularProgressIndicator都是取父容器的尺寸作为绘制的边界的。
             * 可以通过尺寸限制类Widget，如ConstrainedBox、SizedBox来指定尺寸
             */
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              width: 150,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 进度色动画
class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController), // 从灰色变成蓝色
              value: _animationController.value,
            ),
          )
        ],
      ),
    );
  }
}
