import 'package:flutter/material.dart';

class Form_Page extends StatefulWidget {
  @override
  _Form_PageState createState() => _Form_PageState();
}

/*

Form({
  @required Widget child,
  bool autovalidate = false,
  WillPopCallback onWillPop,
  VoidCallback onChanged,
})
autovalidate：是否自动校验输入内容；当为true时，每一个子FormField内容发生变化时都会自动校验合法性，并直接显示错误信息。否则，需要通过调用FormState.validate()来手动校验。
onWillPop：决定Form所在的路由是否可以直接返回（如点击返回按钮），该回调返回一个Future对象，如果Future的最终结果是false，则当前路由不会返回；如果为true，则会返回到上一个路由。此属性通常用于拦截返回按钮。
onChanged：Form的任意一个子FormField内容发生变化时会触发此回调。

const FormField({
  ...
  FormFieldSetter<T> onSaved, //保存回调
  FormFieldValidator<T>  validator, //验证回调
  T initialValue, //初始值
  bool autovalidate = false, //是否自动校验。
})
 */
class _Form_PageState extends State<Form_Page> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form_Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidate: true, //开启自动校验
            child: Column(
              children: <Widget>[
                TextFormField(
                    autofocus: true,
                    controller: _unameController,
                    decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        icon: Icon(Icons.person)),
                    // 校验用户名
                    validator: (v) {
                      return v.trim().length > 0 ? null : "用户名不能为空";
                    }),
                TextFormField(
                    controller: _pwdController,
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        icon: Icon(Icons.lock)),
                    obscureText: true,
                    //校验密码
                    validator: (v) {
                      return v.trim().length > 5 ? null : "密码不能少于6位";
                    }),
                // 登录按钮
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            // 在这里不能通过此方式获取FormState，context不对
                            // print(Form.of(context));
                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              //验证通过提交数据
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
