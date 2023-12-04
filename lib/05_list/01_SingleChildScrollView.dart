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
      body: const SingleChildScrollViewDemo(),
    );
  }
}

class SingleChildScrollViewDemo extends StatelessWidget {
  const SingleChildScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 验证水平滚动
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(10),
          reverse: true,
          child: Row(
            children: [
              OutlinedButton(onPressed: () {}, child: const Text("按钮一")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮二")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮三")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮四")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮五")),
              OutlinedButton(onPressed: () {}, child: const Text("按钮六")),
            ],
          ),
        ),
        // 垂直方向
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(10),
          reverse: false,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(100, (index) => OutlinedButton(onPressed: () {}, child: Text("按钮$index")))
          ),
        )
      ],
    );
  }
}
