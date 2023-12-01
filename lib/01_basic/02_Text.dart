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
      body: const TextDemo(),
    );
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "我们在 YouTube 上有一个 Flutter 频道，欢迎订阅！更多视频和播放列表介绍，以及社区制作的视频教程，可以查看我们的 Flutter 技术视频资源 页面。同时，你可以关注 “Google中国”的哔哩哔哩账号 了解更多更全面的谷歌技术中文内容，也可以关注 “Flutter 社区”的哔哩哔哩账号 了解更多来自社区的内容更新。",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.blue,
            fontFamily: 'SourceSans3'
          ),
          textAlign: TextAlign.left,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.linear(1.5),
        ),
        RichText(
            text: TextSpan(
                text: "Hello",
                style: const TextStyle(fontSize: 40, color: Color.fromRGBO(255, 0, 0, 1)),
                children: [
                  TextSpan(
                    text: "Flutter",
                    style: TextStyle(fontSize: 40, color: Colors.blue[200]),
                  ),
                  const TextSpan(
                    text: "你好世界",
                    style: TextStyle(fontSize: 30, color: Color.fromARGB(0xff, 0x00, 0xff, 0x00)),
                  )
                ]
            )
        )
      ],
    );
  }
}
