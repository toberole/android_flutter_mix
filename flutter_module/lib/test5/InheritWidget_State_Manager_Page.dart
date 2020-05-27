import 'package:flutter/material.dart';

class InheritWidget_State_Manager_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "InheritWidget_State_Manager_Page",
      home: MyHomePage(title: "InheritWidget_State_Manager"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _counter,
      increaseCount: _incrementCounter,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Wrap1()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class Wrap1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap2();
  }
}

class Wrap2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int _counter = CounterProvider.of(context).count;
    final VoidCallback _ingcrese = CounterProvider.of(context).increaseCount;

    return ActionChip(
      onPressed: _ingcrese,
      label: Text(
        '$_counter',
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  int count;
  VoidCallback increaseCount;
  Widget child;

  CounterProvider(
      {Key key,
        @required this.count,
        @required this.increaseCount,
        @required this.child})
      : super(key: key, child: child);

  static CounterProvider of(BuildContext context)=>context.dependOnInheritedWidgetOfExactType(aspect: CounterProvider);

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return count != oldWidget.count;
  }
}
