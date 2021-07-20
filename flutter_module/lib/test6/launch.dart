// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/widgets.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "首页",
      home: ViewPager(),
    );
  }
}

class ViewPager extends StatefulWidget {
  @override
  _ViewPagerState createState() => _ViewPagerState();
}

class _ViewPagerState extends State<ViewPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("launch"),
      ),
      body: Column(
        children: [
          Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: PageView(
                  children: [Page1(), Page2()],
                  onPageChanged: (index) {
                    print("index: $index");
                  },
                ),
                flex: 1,
              ),
              Expanded(
                  child: Row(
                children: [Text("Text1"), Text("Text2"), Text("Text3")],
              ))
            ],
          )
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
    print("_Page1State#initState");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("_Page1State#deactivate");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    super.initState();
    print("_Page2State#initState ......");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("_Page2State#deactivate ......");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
    );
  }
}
