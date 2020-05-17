import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttermodule/test/open_native_activity.dart';
import 'package:fluttermodule/test/secondflutteractivity_page.dart';

import 'test/MyApp.dart';

//void main() => runApp(MyApp(
//      initParams: window.defaultRouteName,
//    ));

//void main() => runApp(
//    OpenNativieActivity()
//);

void main() {
  String initParams = window.defaultRouteName;
  if (initParams.contains("first_flutter_activity_page")) {
    return runApp(OpenNativieActivity());
  } else if (initParams.contains("second_flutter_page")) {
    return runApp(SecondActivityPage());
  }
}
