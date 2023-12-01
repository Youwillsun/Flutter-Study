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
      body: const CardDemo(),
    );
  }
}

class CardDemo extends StatelessWidget {
  const CardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(30),
          color: Colors.purpleAccent[100],
          shadowColor: Colors.yellow,
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: BorderSide(color: Colors.yellow, width: 3)),
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
        Card(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.supervised_user_circle, size: 50),
                title: Text(
                  "李四",
                  style: TextStyle(fontSize: 30),
                ),
                subtitle: Text(
                  "总经理",
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
        )
      ],
    );
  }
}
