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
      body: const MyState(),
    );
  }
}

class MyState extends StatefulWidget {
  const MyState({super.key});

  @override
  State<MyState> createState() => _MyStateState();
}

class _MyStateState extends State<MyState> {
  int _num = 0;
  void _increment() {
    setState(() {
      _num++;
    });
  }

  void _decrement() {
    setState(() {
      _num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShareDataWidget(
        num: _num,
        child: Center(
          child: Column(children: [
            ElevatedButton(onPressed: _increment, child: const Icon(Icons.add)),
            const Padding(
              padding: EdgeInsets.all(10),
              // child: Text('$_num'),
              // 跨组件访问s数据
              child: MyCounter(),
            ),
            ElevatedButton(onPressed: _decrement, child: const Icon(Icons.remove))
          ]),
        ));
  }
}

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!.num.toString());
  }
}

// 数据共享组件
class ShareDataWidget extends InheritedWidget {
  final Widget child;
  final int num;

  const ShareDataWidget({super.key, required this.child, required this.num})
      : super(child: child);

  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return true;
  }
}
