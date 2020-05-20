import 'package:flutter/material.dart';

/*
    Flutter中，可以像Web开发一样使用iconfont，iconfont即“字体图标”，
    它是将图标做成字体文件，然后通过指定不同的字符而显示不同的图片。

    在字体文件中，每一个字符都对应一个位码，而每一个位码对应一个显示字形，
    不同的字体就是指字形不同，即字符对应的字形是不同的。而在iconfont中，
    只是将位码对应的字形做成了图标，所以不同的字符最终就会渲染成不同的图标。

    Material Design所有图标可以在其官网查看：https://material.io/tools/icons/
 */
class Icon_Page extends StatefulWidget {
  @override
  _Icon_PageState createState() => _Icon_PageState();
}

class _Icon_PageState extends State<Icon_Page> {
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Icon_Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(icons,
                style: TextStyle(
                    fontFamily: "MaterialIcons",
                    fontSize: 24,
                    color: Colors.green)),
            // 使用封装好的方式
            Icon(
              Icons.accessible,
              color: Colors.green,
            ),
            Icon(
              Icons.error,
              color: Colors.green,
            ),
            Icon(
              Icons.fingerprint,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
