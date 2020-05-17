/**
 * 先在Android 套壳原生页面FirstFlutterActivity引入Flutter页面。
 * 并在Flutter页面定义如下内容：添加一个textView用来显示其他页面传
 * 过来的内容添加一个button用来打开下个原生页面添加一个button用来返回到上个原生页面
 *
 * 思路：
 * 新建FlutterView -> 在xml中拖一个FrameLayout -> 将FlutterView添加到FrameLayout中 -> 创建FlutterEngine，
 * 并初始化引擎指向一个Flutter页面的路由-> FlutterView使用FlutterEngine加载内容。
 * 此方法WebView的加载方式如出一辙。
 *
 * FlutterView：位于io.flutter.embedding.android包中，负责创建Flutter视图。而且FlutterView继承于FrameLayout
 * FlutterEngine：Flutter负责在Android端执行Dart代码的引擎，将Flutter编写的UI代码渲染到FlutterView中。
 */
 
 Android与Flutter之间的通信共有四种实现方式。
 1、由于在初始化flutter页面时会传递一个字符串——route
 2、通过EventChannel来实现
 3、通过MethodChannel来实现
 4、通过BasicMessageChannel来实现
 
 
 一个FlutterView对应一个FlutterEngine实例；
 一个FlutterEngine实例对应一个Dart Isolate实例；
 同一个进程只有且仅有一个Dart VM虚拟机；
 一个Dart VM上会存在多个Dart Isolate实例，Isolate是dart代码的执行环境
 
 根Widget有以下几种：
 WidgetsApp： 如果需要自定义风格，可以使用WidgetsApp。
 MaterialApp：Material Design风格的Widget。
 CupertinoApp iOS风格的根Widget。