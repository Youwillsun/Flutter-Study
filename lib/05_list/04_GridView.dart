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
      // body: const GridViewCountDemo(),
      // body: const GridViewExtendDemo(),
      body: GridViewBuilderDemo(),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2, // 几列
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        childAspectRatio: 1.5,
        children:
            List.generate(10, (index) => Image.asset('images/flutter.jpg')),
      ),
    );
  }
}

class GridViewExtendDemo extends StatelessWidget {
  const GridViewExtendDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.extent(
        maxCrossAxisExtent: 100, // 子组件宽度
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children:
            List.generate(10, (index) => Image.asset('images/flutter.jpg')),
      ),
    );
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  GridViewBuilderDemo({super.key});

  final List<dynamic> _tiles = [
    Container(color: Colors.black),
    Container(color: Colors.orange),
    Container(color: Colors.blue),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.grey),
    Container(color: Colors.purple),
    Container(color: Colors.yellow),
    Container(color: Colors.brown),
    Container(color: Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.0),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        itemCount: _tiles.length,
        itemBuilder: (context, index) {
          return _tiles[index];
        },
        physics: BouncingScrollPhysics(), // 反弹效果
        // physics: ClampingScrollPhysics(), // 夹住效果
        // physics: AlwaysScrollableScrollPhysics(), // 滚动
        // physics: NeverScrollableScrollPhysics(), // 禁止滚动
      ),
    );
  }
}
