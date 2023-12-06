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
      body: const RadioDemo(),
    );
  }
}

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int gender = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('男'),
              Radio(
                value: 1,
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
              Text('女'),
              Radio(
                value: 2,
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(gender == 1 ? '男' : '女')],
          ),
          RadioListTile(
            title: Text('男性'),
            subtitle: Text('有胡子'),
            secondary: Icon(Icons.person),
            value: 1,
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value!;
              });
            },
            selected: gender == 1,
            selectedTileColor: Colors.green[100],
          ),
          RadioListTile(
            title: Text('女性'),
            subtitle: Text('没有胡子'),
            secondary: Icon(Icons.person),
            value: 2,
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value!;
              });
            },
            selected: gender == 2,
            selectedTileColor: Colors.green[100],
          ),
        ],
      ),
    );
  }
}
