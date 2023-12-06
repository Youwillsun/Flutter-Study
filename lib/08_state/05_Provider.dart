import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 注册数据模型
    return ChangeNotifierProvider(
        create: (BuildContext context) => new LikesModel(),
        child: Scaffold(
          appBar: AppBar(
              title: const Text("首页"),
              leading: const Icon(Icons.menu),
              actions: const [Icon(Icons.settings)],
              elevation: 1,
              centerTitle: true),
          body: const MyHomepage(),
        ));
  }
}

// 创建数据模型
class LikesModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  incrementCounter() {
    _counter++;

    // 通知UI更新
    notifyListeners();
  }
}

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 子组件中使用数据模型
          Text('${context.watch<LikesModel>().counter}'),
          TextButton(
              // 子组件中使用数据模型
              onPressed: Provider.of<LikesModel>(context).incrementCounter,
              child: Icon(Icons.thumb_up))
        ],
      ),
    );
  }
}
