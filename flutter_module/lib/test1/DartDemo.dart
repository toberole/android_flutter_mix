import 'package:flutter/material.dart';

class DartDemo extends StatefulWidget {
  @override
  _DartDemoState createState() => _DartDemoState();
}

class _DartDemoState extends State<DartDemo> {
  /**
   * 可选参数函数
   *    调用方式：
   *      test(1,"hello")
   *      test(1,"hello","world")
   */
  void test(int code, String msg, [String decice]) {
    print("code: $code,msg:$msg");
    if (null != decice) {
      print("device: $decice");
    }
  }

  /**
   * 命名参数函数
   * 定义函数时，使用{param1, param2, …}，放在参数列表的最后面，用于指定命名参数
   * 不能同时使用可选的位置参数和可选的命名参数
   * 调用
   *  test1(code:1,msg:"hello")
   */
  void test1({int code, String msg}) {
    print("code:$code,msg:$msg");
  }

  /**
   * 异步 Future 延迟2秒执行
   */
  void test2() {
    Future.delayed(Duration(seconds: 2), () {
      return "hello future";
    }).then((value) => {print("$value")}).catchError((e) {
      // 捕获异常
      print(e);
    });

    // 捕获异常第二种方式
    Future.delayed(new Duration(seconds: 2), () {
      //return "hi world!";
      throw AssertionError("Error");
    }).then((data) {
      print("success");
    }, onError: (e) {
      print(e);
    });
  }

  /**
   * 异步 Future.whenComplete 类似java的finnaly
   */
  void test3() {
    Future.delayed(new Duration(seconds: 2), () {
      //return "hi world!";
      throw AssertionError("Error");
    }).then((data) {
      //执行成功会走到这里
      print(data);
    }).catchError((e) {
      //执行失败会走到这里
      print(e);
    }).whenComplete(() {
      //无论成功或失败都会走到这里
    });
  }

  /**
   * 异步 Future.wait
   * 有些时候，我们需要等待多个异步任务都执行结束后才进行一些操作，
   * 比如我们有一个界面，需要先分别从两个网络接口获取数据，获取成功后，
   * 我们需要将两个接口数据进行特定的处理后再显示到UI界面上，应该怎么做？
   * 答案是Future.wait，它接受一个Future数组参数，只有数组中所有Future都执行成功后，
   * 才会触发then的成功回调，只要有一个Future执行失败，就会触发错误回调。
   * 下面，我们通过模拟Future.delayed 来模拟两个数据获取的异步任务，
   * 等两个异步任务都执行成功时，将两个异步任务的结果拼接打印出来，代码如下：
   */
  void test4() {
    Future.wait([
      // 2秒后返回结果
      Future.delayed(new Duration(seconds: 2), () {
        return "hello";
      }),
      // 4秒后返回结果
      Future.delayed(new Duration(seconds: 4), () {
        return " world";
      })
    ]).then((results) {
      // 打印结果 hello world
      print(results[0] + results[1]);
    }).catchError((e) {
      print(e);
    });
  }

  String test5_1() {
    return "hello world";
  }

  /**
   * Async/await
   * async用来表示函数是异步的，定义的函数会返回一个Future对象，可以使用then方法添加回调函数。
   * await 后面是一个Future，表示等待该异步任务完成，异步完成后才会往下走；await必须出现在 async 函数内部。
   */
  void test5() async {
    String res = await test5_1();
    print("res: $res");
  }

  /**
   * 异步 Stream
   * Stream 也是用于接收异步事件数据，和Future 不同的是，它可以接收多个异步操作的结果（成功或失败）。
   * 也就是说，在执行异步任务时，可以通过多次触发成功或失败事件来传递结果数据或错误异常。
   * Stream 常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等。
   */
  void test6() {
    Stream.fromFutures([
      // 1秒后返回结果
      Future.delayed(new Duration(seconds: 1), () {
        return "hello 1";
      }),
      // 抛出一个异常
      Future.delayed(new Duration(seconds: 2), () {
        throw AssertionError("Error");
      }),
      // 3秒后返回结果
      Future.delayed(new Duration(seconds: 3), () {
        return "hello 3";
      })
    ]).listen((data) {
      print(data);
    }, onError: (e) {
      print(e.message);
    }, onDone: () {});
  }

  @override
  void initState() {
    super.initState();
    // 变量 var var一旦赋值其类型就确定了 再次赋值只能与第一次赋值类型一致
    var i = 10;
    // error
    // i = "error";

    //可以省略String这个类型声明
    final str = "hi world";
    //final String str = "hi world";
    const str1 = "hi world";
    //const String str1 = "hi world";

    // 函数作为参数
    var func = (str) {
      print(str);
    };
    func("hello world");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dart Demo",
      theme: ThemeData(primaryColor: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dart Demo"),
        ),
        body: Text(
          "Dart Demo",
          style: TextStyle(color: Colors.red, fontSize: 33),
        ),
      ),
    );
  }
}
