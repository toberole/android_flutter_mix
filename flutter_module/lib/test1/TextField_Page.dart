import 'package:flutter/material.dart';

class TextField_Page extends StatefulWidget {
  @override
  _TextField_PageState createState() => _TextField_PageState();
}

/*
获取输入内容有两种方式：

定义两个变量，用于保存用户名和密码，然后在onChange触发时，各自保存一下输入内容。
通过controller直接获取。
 */
class _TextField_PageState extends State<TextField_Page> {
  TextEditingController tec = TextEditingController();

  /*
  焦点可以通过FocusNode和FocusScopeNode来控制，
  默认情况下，焦点由FocusScope来管理，它代表焦点控制范围，
  可以在这个范围内可以通过FocusScopeNode在输入框之间移动焦点、设置默认焦点等。
  我们可以通过FocusScope.of(context) 来获取Widget树中默认的FocusScopeNode。
   */

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    // 设置默认值
    tec.text = "hello xxxxx";
    // 设置默认选中的文本
    tec.selection = TextSelection(baseOffset: 2, extentOffset: tec.text.length);
    // 通过Controller 监控输入框变化
    tec.addListener(() {
      print("${tec.text}");
    });

    // 监听焦点变化
    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextField_Form_Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "电子邮件地址",
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none //隐藏下划线
                      )),
              decoration: BoxDecoration(
                  // 下滑线浅灰色，宽度1像素
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[200], width: 1.0))),
            ),
            // 自定义样式
            TextField(
              decoration: InputDecoration(
                  labelText: "aaaaaaaa",
                  // 未获得焦点下划线设为红色
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            TextField(
              // 输入有变化时回调
              onChanged: (v) {
                TextField_onChanged(v);
              },
              // 输入完成时回调
              onEditingComplete: () {
                TextField_onEditingComplete();
              },
              controller: tec,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: "hello world",
                  labelText: "username",
                  prefixIcon: Icon(Icons.people)),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),

            // 控制焦点
            TextField(
              autofocus: true,
              focusNode: focusNode1, // 关联focusNode1
              decoration: InputDecoration(labelText: "input1"),
            ),
            TextField(
              focusNode: focusNode2, // 关联focusNode1
              decoration: InputDecoration(labelText: "input2"),
            ),
            RaisedButton(
              child: Text("移动焦点"),
              onPressed: () {
                // 将焦点从第一个TextField移到第二个TextField
                // 这是一种写法
                // FocusScope.of(context).requestFocus(focusNode2);
                // 这是第二种写法
                if (null == focusScopeNode) {
                  focusScopeNode = FocusScope.of(context);
                }
                focusScopeNode.requestFocus(focusNode2);
              },
            ),
            RaisedButton(
              child: Text("隐藏键盘"),
              onPressed: () {
                // 当所有编辑框都失去焦点时键盘就会收起
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }

  void TextField_onChanged(String v) {
    print("TextField_onChanged $v");
  }

  void TextField_onEditingComplete() {
    print("TextField_onEditingComplete ${tec.text}");
  }
}
