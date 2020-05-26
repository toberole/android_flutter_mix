import 'package:flutter/material.dart';

class Toast {
  static void show({@required BuildContext context, @required String message}) {
    // 创建一个OverlayEntry对象
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return Positioned(
        top: MediaQuery.of(context).size.height * 0.7,
        child: Material(
          child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      // border: Border.all(color: Color(0xFFFFFF00), width: 0.5),
                      // 边色与边宽度
                      color: Color(0xFF9E9E9E),
                      // 底色
                      //        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
                      shape: BoxShape.rectangle,
                      // 默认值也是矩形
                      borderRadius: new BorderRadius.circular((20.0)), // 圆角度
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text(
                        message,
                      ),
                    ),
                  )
                ],
              )),
        ),
      );
    });

    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    //两秒后，移除Toast
    new Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }
}
