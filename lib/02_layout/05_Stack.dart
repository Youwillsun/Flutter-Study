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
      body: const StackDemo(),
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        // 声明未定位子组件排序方式
        textDirection: TextDirection.rtl,
        // 声明未定位子组件对齐方式
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://himg.bdimg.com/sys/portrait/item/public.1.f02d5419.4lnYMc1vGvDDmM9ZRgs5JQ.jpg'),
            radius: 200,
          ),
          Positioned(
            top: 50,
            right: 40,
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(10),
              child: const Text(
                '热卖',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const Text(
            'Hello',
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
        ],
      ),
    );
  }
}
