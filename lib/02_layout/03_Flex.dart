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
      body: const FlexDemo(),
    );
  }
}

class FlexDemo extends StatelessWidget {
  const FlexDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 验证Expanded
        Row(
          children: [
            Container(
              color: Colors.lightBlue,
              width: 50,
              height: 50,
            ),
            Expanded(
                child: Container(
              color: Colors.lightGreen,
              height: 50,
            ))
          ],
        ),
        const Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          textDirection: TextDirection.rtl, // 声明水平方向排列方式
          children: [
            Icon(Icons.access_alarm, size: 50),
            Icon(Icons.accessible_forward_outlined, size: 50),
            Icon(Icons.settings, size: 50),
            Icon(Icons.add_box, size: 50),
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Container(
                color: Colors.tealAccent,
                height: 50,
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                color: Colors.amberAccent,
                height: 50,
              ),
              flex: 1,
            )
          ],
        ),
        Container(
          height: 100,
          margin: EdgeInsets.all(50),
          child: Flex(
            direction: Axis.vertical,
            // verticalDirection: VerticalDirection.up, // 垂直方向排列顺序
            children: [
              Expanded(
                child: Container(
                  color: Colors.tealAccent,
                  height: 50,
                ),
                flex: 2,
              ),
              // 空行占位
              Spacer(
                flex: 1,
              ),
              Expanded(
                child: Container(
                  color: Colors.amberAccent,
                  height: 50,
                ),
                flex: 1,
              )
            ],
          ),
        )
      ],
    );
  }
}
