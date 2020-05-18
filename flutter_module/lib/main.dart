import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttermodule/test/open_native_activity.dart';
import 'package:fluttermodule/test/secondflutteractivity_page.dart';

import 'test/FlutterFragmentPage.dart';
import 'test/MyFlutterActivity_page.dart';

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
  } else {
    return runApp(SecondActivityPage());
  }
}

void main_x() {
  String initParams = window.defaultRouteName;
  print("xxxxx main_x initParams:$initParams");

  return runApp(SecondActivityPage());
}
