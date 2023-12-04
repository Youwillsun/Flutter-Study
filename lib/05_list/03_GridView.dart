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
      body: const GridViewDemo(),
    );
  }
}

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      // GridView(
      //   padding: const EdgeInsets.all(20),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 20, // 主轴方向的边距
      //     crossAxisSpacing: 20, // 交叉轴边距
      //     childAspectRatio: 1.5 // 子组件宽高比例
      //   ),
      //   children: [
      //     Container(color: Colors.black),
      //     Container(color: Colors.orange),
      //     Container(color: Colors.blue),
      //     Container(color: Colors.red),
      //     Container(color: Colors.green),
      //     Container(color: Colors.grey),
      //     Container(color: Colors.purple),
      //     Container(color: Colors.yellow),
      //     Container(color: Colors.brown),
      //     Container(color: Colors.teal),
      //   ],
      // ),
      GridView(
        padding: const EdgeInsets.all(20),
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 190, // 子组件宽度
          mainAxisSpacing: 20, // 主轴方向的边距
          crossAxisSpacing: 20, // 交叉轴边距
          childAspectRatio: 0.8
        ),
        children: [
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
        ],
      ),
    );
  }
}