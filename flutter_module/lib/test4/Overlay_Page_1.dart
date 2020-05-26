import 'package:flutter/material.dart';
import 'package:fluttermodule/test4/Toast.dart';

class Overlay_Page_1 extends StatefulWidget {
  @override
  _Overlay_Page_1State createState() => _Overlay_Page_1State();
}

class _Overlay_Page_1State extends State<Overlay_Page_1> {
  FocusNode focusNode = new FocusNode();
  OverlayEntry overlayEntry;
  LayerLink layerLink = new LayerLink();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        overlayEntry = createSelectPopupWindow();
        Overlay.of(context).insert(overlayEntry);
      } else {
        overlayEntry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /**
   * 利用Overlay实现PopupWindow效果，悬浮的widget
   * 利用CompositedTransformFollower和CompositedTransformTarget
   */
  OverlayEntry createSelectPopupWindow() {
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      return new Positioned(
        width: 200,
        child: new CompositedTransformFollower(
          offset: Offset(0.0, 50),
          link: layerLink,
          child: new Material(
            child: new Container(
                color: Colors.grey,
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text("选项1"),
                      onTap: () {
                        Toast.show(context: context, message: "选择了选项1");
                        focusNode.unfocus();
                      },
                    ),
                    new ListTile(
                        title: new Text("选项2"),
                        onTap: () {
                          Toast.show(context: context, message: "选择了选项1");
                          focusNode.unfocus();
                        }),
                  ],
                )),
          ),
        ),
      );
    });
    return overlayEntry;
  }

}
