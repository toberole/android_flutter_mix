import 'package:flutter/material.dart';

/*
Flutter中，我们可以通过Image组件来加载并显示图片，Image的数据源可以是asset、文件、内存以及网络。
ImageProvider
    ImageProvider 是一个抽象类，主要定义了图片数据获取的接口load()，
    从不同的数据源获取图片需要实现不同的ImageProvider ，如AssetImage是实现了
    从Asset中加载图片的ImageProvider，而NetworkImage实现了从网络加载图片的ImageProvider。
 */

/*
const Image({
    ...
    this.width, //图片的宽
    this.height, //图片高度
    this.color, //图片的混合色值
    this.colorBlendMode, //混合模式
    this.fit,//缩放模式
    this.alignment = Alignment.center, //对齐方式
    this.repeat = ImageRepeat.noRepeat, //重复方式
    ...
})


 */
class Img_page extends StatefulWidget {
  @override
  _Img_pageState createState() => _Img_pageState();
}

class _Img_pageState extends State<Img_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Icon_Img_page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              width: 100,
              height: 100,
              image: AssetImage("images/test.jpeg"),
            ),
            Image(
              image: AssetImage("images/test.jpeg"),
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            Image(
              height: 100,
              width: 100,
              image: NetworkImage(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589975237861&di=0cd6f7d81f2df119034d2960c5e26958&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F36%2F48%2F19300001357258133412489354717.jpg"),
            ),
            Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589975237861&di=0cd6f7d81f2df119034d2960c5e26958&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F36%2F48%2F19300001357258133412489354717.jpg",
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
