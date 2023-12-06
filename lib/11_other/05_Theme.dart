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
        centerTitle: true,
      ),
      body: const ThemeDemo(),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Theme Example',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('按钮'),
          ),
          // 对主题有反应的按钮
          ElevatedButton(
            onPressed: () {},
            child: const Text('OutlinedButton'),
          ),
          const Icon(Icons.person),
          const Icon(Icons.abc),
          // 声明局部主题样式
          Theme(
            data: ThemeData(
              iconTheme: IconThemeData(color: Colors.pink, size: 100),
            ),
            child: Icon(Icons.access_alarm),
          ),
          const Card(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.supervised_user_circle, size: 50),
                  title: Text(
                    "张三",
                    style: TextStyle(fontSize: 30),
                  ),
                  subtitle: Text(
                    "董事长",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "电话: 13333333333",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  title: Text(
                    "地址:xxxxxxxx",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
