import 'package:flutter/material.dart';

/**
 * 路由(Route)在移动开发中通常指页面（Page），这跟web开发中单页应用的Route概念意义是相同的，
 * Route在Android中通常指一个Activity，在iOS中指一个ViewController。
 * 所谓路由管理，就是管理页面之间如何跳转，通常也可被称为导航管理。
 * Flutter中的路由管理和原生开发类似，无论是Android还是iOS，导航管理都会维护一个路由栈，路由入栈(push)操作对应打开一个新页面，
 * 路由出栈(pop)操作对应页面关闭操作，而路由管理主要是指如何来管理路由栈。
 */
class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: ThemeData(primaryColor: Colors.white),
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(
              builder: (context) {
                return RaisedButton(
                  child: Text("open new route"),
                  textColor: Colors.blueGrey,
                  onPressed: () {
                    print("FlatButton onPressed ......");

                    Navigator.push(context,
                        // MaterialPageRoute继承自PageRoute类，PageRoute类是一个抽象类，
                        // 表示占有整个屏幕空间的一个模态路由页面，它还定义了路由构建
                        // 及切换时过渡动画的相关接口及属性。MaterialPageRoute
                        // 是Material组件库提供的组件，它可以针对不同平台，实现与平台页面
                        // 切换动画风格一致的路由切换动画：
                        // 如果想自定义路由切换动画，可以自己继承PageRoute来实现
                        MaterialPageRoute(builder: (context) {
                      return NextPage();
                    }));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

/*

MaterialPageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
})
builder 是一个WidgetBuilder类型的回调函数，它的作用是构建路由页面的具体内容，返回值是一个widget。我们通常要实现此回调，返回新路由的实例。
settings 包含路由的配置信息，如路由名称、是否初始路由（首页）。
maintainState：默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false。
fullscreenDialog表示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）。



 */