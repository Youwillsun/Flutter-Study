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
      body: const ButtonDemo(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: "Increment",
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        children: [
          TextButton(
              onPressed: () {
                print('点击 TextButton');
              },
              onLongPress: () {
                print('长按 TextButton');
              },
              child: const Text('TextButton')),
          ElevatedButton(
              onPressed: () {
                print('点击 ElevatedButton');
              },
              onLongPress: () {
                print('长按 ElevatedButton');
              },
              child: const Text('ElevatedButton')),
          OutlinedButton(
              onPressed: () {
                print('点击 OutlinedButton');
              },
              onLongPress: () {
                print('长按 OutlinedButton');
              },
              child: const Text('OutlinedButton')),
          OutlinedButton(
              onPressed: () {
                print('点击 OutlinedButton');
              },
              onLongPress: () {
                print('长按 OutlinedButton');
              },
              style: ButtonStyle(
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 30)),
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    // 按下按钮时的前景色
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return Colors.blue;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    // 按下按钮时的前景色
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.yellow;
                    }
                    return Colors.white;
                  }),
                  shadowColor: MaterialStateProperty.all(Colors.yellow),
                  elevation: MaterialStateProperty.all(20),
                  // 边框
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.green, width: 2)),
                  // 按钮形状
                  shape: MaterialStateProperty.all(const StadiumBorder(
                      side: BorderSide(color: Colors.green, width: 2))),
                  // 按钮大小
                  maximumSize: MaterialStateProperty.all(const Size(180, 90)),
                  // 水波纹效果
                  overlayColor: MaterialStateProperty.all(Colors.purple)),
              child: const Text('轮廓按钮')),
          OutlinedButtonTheme(
            data: OutlinedButtonThemeData(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.red))),
            child: OutlinedButton(
              onPressed: () {
                print('点击 OutlinedButton');
              },
              onLongPress: () {
                print('长按 OutlinedButton');
              },
              style: ButtonStyle(
                  // 样式中声明的样式如果和主题中重复，则主题中的不生效
                  overlayColor: MaterialStateProperty.all(Colors.red)),
              child: const Text('OutlinedButton'),
            ),
          ),
          // 图标按钮
          IconButton(
              onPressed: () {
                print('IconButton');
              },
              color: Colors.red,
              splashColor: Colors.lightBlue,
              highlightColor: Colors.purple,
              tooltip: "怎么了", // 长按会出现
              icon: const Icon(Icons.add_alarm)),
          TextButton.icon(
              onPressed: () {
                print('文本按钮 icon');
              },
              icon: const Icon(Icons.add_circle),
              label: const Text("文本按钮")),
          ElevatedButton.icon(
              onPressed: () {
                print('凸起按钮 icon');
              },
              icon: const Icon(Icons.add_circle),
              label: const Text("凸起按钮")),
          OutlinedButton.icon(
              onPressed: () {
                print('轮廓按钮 icon');
              },
              icon: const Icon(Icons.add_circle),
              label: const Text("轮廓按钮")),
          // 按钮组
          Container(
            color: Colors.pink,
            width: double.infinity,
            // 按钮默认横向排列，当按钮显示不下时，会垂直排列
            child: ButtonBar(
              children: [
                ElevatedButton(
                    onPressed: () {
                      print("按钮一");
                    },
                    child: const Text("按钮一")),
                ElevatedButton(
                    onPressed: () {
                      print("按钮一");
                    },
                    child: const Text("按钮一")),
                ElevatedButton(
                    onPressed: () {
                      print("按钮一");
                    },
                    child: const Text("按钮一")),
              ],
            ),
          ),
          BackButton(
            color: Colors.red,
            onPressed: () {
              print("回退按钮");
            },
          ),
          CloseButton(
            color: Colors.red,
            onPressed: () {
              print("关闭按钮");
            },
          )
        ],
      ),
    );
  }
}
