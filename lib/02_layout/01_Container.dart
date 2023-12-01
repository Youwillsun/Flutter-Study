import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("首页"),
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.settings)],
          elevation: 1,
          centerTitle: true),
      body: const ContainerDemo(),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      // width: double.infinity, // 占满父容器宽度
      // height: double.infinity, // 占满父容器高度
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(10, 30, 0, 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 10),
        // border: Border(
        //   top: BorderSide(color: Colors.red, width: 10),
        //   bottom: BorderSide(color: Colors.red, width: 10),
        //   left: BorderSide(color: Colors.red, width: 10),
        //   right: BorderSide(color: Colors.red, width: 10),
        // ),
        // borderRadius必须在boder颜色均匀(四边颜色一直)时才会生效
        // borderRadius: BorderRadius.all(Radius.circular(10)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30)
        ),
        color: Colors.lightGreen[100],
        gradient: const LinearGradient(colors: [Colors.lightBlue, Colors.white12]), // 设置了渐变之后，背景色color会失效
      ),
      alignment: Alignment.center,
      // transform: Matrix4.translationValues(100, 0, 0), // 平移
      // transform: Matrix4.rotationZ(-0.1), // 旋转
      transform: Matrix4.skewX(0.2), // 斜切
      child: const Text(
        "我们在 YouTube 上有一个 Flutter 频道，欢迎订阅！更多视频和播放列表介绍，以及社区制作的视频教程，可以查看我们的 Flutter 技术视频资源 页面。",
        style: TextStyle(fontSize: 20),
      )
    );
  }
}
