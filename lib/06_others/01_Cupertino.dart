import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

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
      body: const MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    // final Widget dialogBox;
    // // 判断当前的平台信息
    // if (Platform.isIOS) {
    //   // 加载IOS风格
    //   dialogBox = CupertinoDemo();
    // } else if (Platform.isAndroid) {
    //   // 加载android风格
    //   dialogBox = MaterialDemo();
    // }

    return Container(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 安卓风格组件
          Text('material 安卓风格'),
          MaterialDemo(),
          // IOS风格组件
          Text('Cupertino IOS风格'),
          CupertinoDemo()
        ],
      ),
    );
  }
}

class MaterialDemo extends StatelessWidget {
  const MaterialDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: const Text("提示"),
        content: const Text("确认删除吗？"),
        actions: [
          TextButton(
              onPressed: () {
                print("取消的逻辑");
              },
              child: const Text("取消")),
          TextButton(
              onPressed: () {
                print("确认的逻辑");
              },
              child: const Text("确认"))
        ],
      ),
    );
  }
}

class CupertinoDemo extends StatelessWidget {
  const CupertinoDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoAlertDialog(
        title: const Text("提示"),
        content: const Text("确认删除吗？"),
        actions: [
          CupertinoDialogAction(
              onPressed: () {
                print("取消的逻辑");
              },
              child: const Text("取消")),
          CupertinoDialogAction(
              onPressed: () {
                print("确认的逻辑");
              },
              child: const Text("确认"))
        ],
      ),
    );
  }
}
