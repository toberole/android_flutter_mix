import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttermodule/test/open_native_activity_navigator_builder.dart';
import 'package:fluttermodule/test/secondflutteractivity_page.dart';
import 'package:fluttermodule/test1/ButtonPage.dart';
import 'package:fluttermodule/test1/DartDemo.dart';
import 'package:fluttermodule/test1/Icon_Page.dart';
import 'package:fluttermodule/test1/Page1.dart';
import 'package:fluttermodule/test1/RoutePage.dart';
import 'package:fluttermodule/test1/TextPage.dart';
import 'package:fluttermodule/test1/lifecycle.dart';

import 'test/FlutterFragmentPage.dart';
import 'test/MyFlutterActivity_page.dart';
import 'test/ThirdFlutterActivity_page.dart';
import 'test/layout_test.dart';
import 'test1/Form_Page.dart';
import 'test1/Img_Page.dart';
import 'test1/Progress_Page.dart';
import 'test1/Switch_Checkbox_Page.dart';
import 'test1/TextField_Page.dart';
import 'test2/Flex_Expanded_LayoutPage.dart';
import 'test2/Row_Column_LayoutPage.dart';

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
    return runApp(Flex_Expanded_LayoutPage());


  } else {
    return runApp(SecondActivityPage());
  }
}

void main_x() {
  String initParams = window.defaultRouteName;
  print("xxxxx main_x initParams:$initParams");

  return runApp(SecondActivityPage());
}
