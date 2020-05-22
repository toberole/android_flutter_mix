android release 下 flutter 的编译产物包含 4 部分：
libflutter.so： flutter engin
libapp.so：dart 源码相关
flutter_assets：flutter 资源文件
flutter_embedding.jar：提供了 flutter 嵌入 native 的能力。

在flutter_module根目录下执行 flutter build aar 可以把moudle打包成aar
注意在host/outputs下面需要有个repo文件夹，然后修改主APP的gradle[app/build.gradle ]
Consuming the Module
  1. Open <host>/app/build.gradle
  2. Ensure you have the repositories configured, otherwise add them:

      repositories {
        maven {
            url '/Users/wangzhen/code/flutter_module/build/host/outputs/repo'
        }
        maven {
            url 'http://download.flutter.io'
        }
      }

  3. Make the host app depend on the Flutter module:

    dependencies {
      debugImplementation 'com.wangzhen.flutter_module:flutter_debug:1.0
      profileImplementation 'com.wangzhen.flutter_module:flutter_profile:1.0
      releaseImplementation 'com.wangzhen.flutter_module:flutter_release:1.0
    }


  4. Add the `profile` build type:

    android {
      buildTypes {
        profile {
          initWith debug
        }
      }
    }

To learn more, visit https://flutter.dev/go/build-aar
flutter build aar 的时候会创建一个 maven 仓库
