import 'package:flutter/material.dart';

/*
Material 组件库中提供了Material风格的单选开关Switch和复选框Checkbox，
虽然它们都是继承自StatefulWidget，但它们本身不会保存当前选中状态，
选中状态都是由父组件来管理的。当Switch或Checkbox被点击时，
会触发它们的onChanged回调，可以在此回调中处理选中状态改变逻辑
 */
class Switch_Checkbox_Page extends StatefulWidget {
  @override
  _Switch_Checkbox_PageState createState() => _Switch_Checkbox_PageState();
}

class _Switch_Checkbox_PageState extends State<Switch_Checkbox_Page> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Switch_Checkbox_Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: _switchSelected,
              onChanged: (v) {
                _switchSelected = v;
                setState(() {});
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, // //选中时的颜色
              onChanged: (v) {
                _checkboxSelected = v;
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
