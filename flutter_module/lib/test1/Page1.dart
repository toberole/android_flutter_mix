import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int count = 0;

  incre() {
    // setState方法的作用是通知Flutter框架，有状态发生了改变，
    // Flutter框架收到通知后，会执行build方法来根据新的状态重新构建界面
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // MaterialApp 是Material库中提供的Flutter APP框架，
    // 通过它可以设置应用的名称、主题、语言、首页及路由列表等
    return MaterialApp(
      // 应用名称
      title: "计数器",
      theme: ThemeData(primaryColor: Colors.blue),
      // Scaffold 是 Material 库中提供的页面脚手架，它提供了默认的导航栏、标题和包含主屏幕widget树
      home: Scaffold(
        appBar: AppBar(
          title: Text("计数器"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You have pushed the button this many times:"),
              Text(
                "$count",
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: incre,
          tooltip: "add",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
