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
      body: const WrapDemo(),
    );
  }
}

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> _list = [
      '曹操', '司马懿', '曹仁', '曹洪', '张辽', '许诸'
    ];

    List<Chip> _weiGuo() {
      return _list.map((item){
        return Chip(
          avatar: const CircleAvatar(
            backgroundColor: Colors.black,
            child: Text("魏", style: TextStyle(fontSize: 12, color: Colors.white),),
          ),
          label: Text(item),
        );
      }).toList();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Wrap(
          spacing: 18, // 水平间距
          runSpacing: 15, // 垂直间距
          alignment: WrapAlignment.spaceAround, // 主轴对齐方式
          // runAlignment: WrapAlignment.spaceAround, // 交叉轴对齐方式【已经在column里了，效果不是很明显】
          children: _weiGuo(),
        ),
        const Wrap(
          children: [
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("刘备"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("张飞"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("关羽"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("赵云"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("诸葛亮"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("黄忠"),
            )
          ],
        )
      ],
    );
  }
}
