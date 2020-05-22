 flutter启动时会最先执行main.dart中的main方法
 
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
 
 Wrap_content ,Wrap_content :
  //use this as child
  Wrap(
   children: <Widget>[*your_child*])
   
 Match_parent,Match_parent:
  //use this as child
 Container(
         height: double.infinity,
     width: double.infinity,child:*your_child*)
 
 Match_parent,Wrap_content :
  //use this as child
 Row(
   mainAxisSize: MainAxisSize.max,
   children: <Widget>[*your_child*],
 );
 
 Wrap_content ,Match_parent:
  //use this as child
 Column(
   mainAxisSize: MainAxisSize.max,
   children: <Widget>[your_child],
 );
 
 容器类Widget
 容器类Widget和布局类Widget都作用于其子Widget，不同的是：
 布局类Widget一般都需要接收一个widget数组（children），他们直接或间接继承自（或包含）MultiChildRenderObjectWidget ；而容器类Widget一般只需要接收一个子Widget（child），他们直接或间接继承自（或包含）SingleChildRenderObjectWidget。
 布局类Widget是按照一定的排列方式来对其子Widget进行排列；而容器类Widget一般只是包装其子Widget，对其添加一些修饰（补白或背景色等）、变换(旋转或剪裁等)、或限制(大小等)。
