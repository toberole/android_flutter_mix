import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:fluttermodule/test/open_native_activity_navigator_builder.dart';
import 'package:fluttermodule/test/secondflutteractivity_page.dart';
import 'package:fluttermodule/test0/MT_Page.dart';
import 'package:fluttermodule/test1/ButtonPage.dart';
import 'package:fluttermodule/test1/DartDemo.dart';
import 'package:fluttermodule/test1/Icon_Page.dart';
import 'package:fluttermodule/test1/Page1.dart';
import 'package:fluttermodule/test1/RoutePage.dart';
import 'package:fluttermodule/test1/TextPage.dart';
import 'package:fluttermodule/test1/lifecycle.dart';
import 'package:fluttermodule/test3/Box_Page.dart';
import 'package:fluttermodule/test3/Padding_Page.dart';
import 'package:fluttermodule/test5/Counter.dart';
import 'package:fluttermodule/test5/State_Manager_Page.dart';
import 'package:provide/provide.dart';

import 'test/FlutterFragmentPage.dart';
import 'test/MyFlutterActivity_page.dart';
import 'test/ThirdFlutterActivity_page.dart';
import 'test/layout_test.dart';
import 'test1/Form_Page.dart';
import 'test1/Img_Page.dart';
import 'test1/Progress_Page.dart';
import 'test1/Switch_Checkbox_Page.dart';
import 'test1/TextField_Page.dart';
import 'test2/Align_Page.dart';
import 'test2/Flex_Expanded_LayoutPage.dart';
import 'test2/Row_Column_LayoutPage.dart';
import 'test2/Stack_Positioned_LayoutPage.dart';
import 'test2/Wrap_Flow_LayoutPage.dart';
import 'test3/Clip_Page.dart';
import 'test3/Container_Page.dart';
import 'test3/DecoratedBox_Page.dart';
import 'test3/Material_Page.dart';
import 'test3/Transform_Page.dart';
import 'test4/Overlay_Page.dart';

//void main() => runApp(MyApp(
//      initParams: window.defaultRouteName,
//    ));

//void main() => runApp(
//    OpenNativieActivity()
//);

void main() {
  String initParams = window.defaultRouteName;
  print("xxxxx main initParams:$initParams");

  if (initParams.contains("first_flutter_activity_page")) {
    return runApp(OpenNativieActivity());
  } else if (initParams.contains("second_flutter_page")) {
    return runApp(SecondActivityPage());
  } else if (initParams.contains("FlutterFragmentPage")) {
    return runApp(FlutterFragmentPage());
  } else if (initParams.contains("MyFlutterActivity")) {
    return runApp(MyFlutterActivityPage());
  } else if (initParams.contains("ThirdFlutterActivity")) {
    return runApp(ThirdFlutterActivityPage());
  } else if (initParams.contains("TestFlutterActivity")) {
    return runApp(LayoutTest());
  } else if (initParams.contains("MT_Page_Activity")) {
    return runApp(MT_Page());
  } else if (initParams.contains("StudyFlutterActivity")) {
    // return runApp(DartDemo());
    // return runApp(Page1());
    // return runApp(RoutePage());
    // return runApp(LifeCyclePage());
    // return runApp(TextPage());
    // return runApp(ButtonPage());
    // return runApp(Img_page());
    // return runApp(Icon_Page());
    // return runApp(Switch_Checkbox_Page());
    // return runApp(TextField_Page());
    // return runApp(Form_Page());
    // return runApp(Progress_Page());
    // return runApp(Row_Column_LayoutPage());
    // return runApp(Flex_Expanded_LayoutPage());
    // return runApp(Wrap_Flow_LayoutPage());
    // return runApp(Stack_Positioned_LayoutPage());
    // return runApp(Align_Page());
    // return runApp(Padding_Page());
    // return runApp(Box_Page());
    // return runApp(DecoratedBox_Page());
    // return runApp(DecoratedBox_Page());
    // return runApp(Transform_Page());
    // return runApp(Container_Page());
    // return runApp(Material_Page());
    // return runApp(Clip_Page());
    // return runApp(Overlay_Page());

    ////////////////状态管理//////////////
    var counter = Counter();
    var providers = Providers();
    providers.provide(Provider<Counter>.value(counter));
    var providerNode = ProviderNode(
      providers: providers,
      child: State_Manager_Page(),
    );

    return runApp(providerNode);
  } else {
    return runApp(SecondActivityPage());
  }
}

void main_x() {
  String initParams = window.defaultRouteName;
  print("xxxxx main_x initParams:$initParams");
  return runApp(SecondActivityPage());
}
