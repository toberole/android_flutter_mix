import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttermodule/test/FlutterFragmentPage.dart';
import 'package:fluttermodule/test/MyFlutterActivity_page.dart';
import 'package:fluttermodule/test/ThirdFlutterActivity_page.dart';
import 'package:fluttermodule/test/layout_test.dart';

import 'package:fluttermodule/test/open_native_activity_navigator_builder.dart';
import 'package:fluttermodule/test/secondflutteractivity_page.dart';
import 'package:fluttermodule/test0/MT_Page.dart';
import 'package:fluttermodule/test5/Counter.dart';
import 'package:fluttermodule/test5/State_Manager_Page.dart';
import 'package:fluttermodule/test5/extension_page.dart';
import 'package:provide/provide.dart';

void test_main() {
  String initParams = window.defaultRouteName;
  print("xxxxx test_main ......");

  return runApp(OpenNativieActivity());
}

////////////////状态管理 provide: ^1.0.2//////////////
void provide_test() {
  var counter = Counter();
  var providers = Providers();
  providers.provide(Provider<Counter>.value(counter));
  var providerNode = ProviderNode(
    providers: providers,
    child: State_Manager_Page(),
  );

  return runApp(providerNode);
}

void main_x() {
  String initParams = window.defaultRouteName;
  print("xxxxx aaaaaaa main_x initParams:$initParams");
  return runApp(SecondActivityPage());
}
