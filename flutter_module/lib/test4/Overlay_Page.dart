import 'package:flutter/material.dart';
import 'package:fluttermodule/test4/Toast.dart';

/*
Overlay是一个Stack的widget，可以将overlay entry插入到overlay中，使独立的child窗口悬浮于其他widget之上。
因为Overlay本身使用的是[Stack]布局，所以overlay entry可以使用[Positioned] 或者 [AnimatedPositioned]在overlay中定位自己的位置。
当我们创建MaterialApp的时候，它会自动创建一个Navigator，然后创建一个Overlay; 然后利用这个Navigator来管理路由中的界面。
就我感觉，有点类似Android中的WindowManager，可以利用addView和removeView方法添加或删除View到界面中。

Overlay的使用方法
//创建OverlayEntry
Overlay entry=new OverlayEntry(builder:(){/*在这里创建对应的widget*/});
//往Overlay中插入插入OverlayEntry
Overlay.of(context).insert(overlayEntry);
//调用entry自身的remove()方法，从所在的overlay中移除自己
entry.remove();

 */
class Overlay_Page extends StatefulWidget {
  @override
  _Overlay_PageState createState() => _Overlay_PageState();
}

class _Overlay_PageState extends State<Overlay_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Overlay_Page",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Overlay_Page"),
          actions: <Widget>[
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    showPopWindow(context);
                  },
                  icon: Icon(Icons.add),
                );
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () {
                        Toast.show(context: context, message: "hello toast");
                      },
                      child: Text("显示Toast"),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }

  /**
   * popwindow
   */
  void showPopWindow(BuildContext context) {
    OverlayEntry weixinOverlayEntry = new OverlayEntry(builder: (context) {
      return new Positioned(
          top: kToolbarHeight,
          right: 20,
          width: 200,
          height: 320,
          child: new SafeArea(
              child: new Material(
            child: new Container(
              color: Colors.black,
              child: new Column(
                children: <Widget>[
                  Expanded(
                    child: new ListTile(
                      leading: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      title: new Text(
                        "发起群聊",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("添加朋友",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("扫一扫",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("首付款",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("帮助与反馈",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          )));
    });
    Overlay.of(context).insert(weixinOverlayEntry);
  }
}
