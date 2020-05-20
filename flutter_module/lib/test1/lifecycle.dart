import 'package:flutter/material.dart';

class LifeCyclePage extends StatefulWidget {
  @override
  _LifeCyclePageState createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage>
    with WidgetsBindingObserver {
  static const TAG = "_LifeCyclePageState";

  /**
   * 在Activity的onResume之后回调
   */
  @override
  void initState() {
    super.initState();
    print("$TAG initState");

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didUpdateWidget(LifeCyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("$TAG didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("$TAG deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("$TAG dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("$TAG reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("$TAG didChangeDependencies");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print("$TAG didChangeAppLifecycleState inactive");
        break;
      case AppLifecycleState.paused:
        print("$TAG didChangeAppLifecycleState paused");
        break;
      case AppLifecycleState.resumed:
        print("$TAG didChangeAppLifecycleState resumed");
        break;
      case AppLifecycleState.detached:
        print("$TAG didChangeAppLifecycleState detached");
        break;
    }
  }

  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    print("$TAG didHaveMemoryPressure");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "生命周期",
      home: Text("生命周期"),
    );
  }
}
