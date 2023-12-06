import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
      body: const CheckboxDemo(),
    );
  }
}

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _male = true;
  bool _female = false;
  bool _transgener = true;
  bool _value1 = true;
  bool _value2 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
            value: _male,
            onChanged: (value) {
              setState(() {
                _male = value!;
              });
            },
          ),
          title: const Text('男'),
        ),
        ListTile(
          leading: Checkbox(
            value: _female,
            onChanged: (value) {
              setState(() {
                _female = value!;
              });
            },
          ),
          title: const Text('女'),
        ),
        ListTile(
          leading: Checkbox(
            value: _transgener,
            onChanged: (value) {
              setState(() {
                _transgener = value!;
              });
            },
            activeColor: Colors.pink,
            checkColor: Colors.yellow,
          ),
          title: const Text('人妖'),
        ),
        CheckboxListTile(
          secondary: const Icon(
            Icons.settings,
            size: 50,
          ),
          value: _value1,
          onChanged: (value) {
            setState(() {
              _value1 = value!;
            });
          },
          title: const Text('一点钟叫我起床'),
          subtitle: const Text('太困了起不来'),
          activeColor: Colors.green,
          checkColor: Colors.yellow,
          selected: _value1,
        ),
        CheckboxListTile(
          secondary: const Icon(
            Icons.settings,
            size: 50,
          ),
          value: _value2,
          onChanged: (value) {
            setState(() {
              _value2 = value!;
            });
          },
          title: const Text('三点钟叫我起床'),
          subtitle: const Text('这还差不多'),
        ),
      ],
    );
  }
}
