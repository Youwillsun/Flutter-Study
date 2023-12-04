import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      body: const ShartPerferencesDemo(),
    );
  }
}

class ShartPerferencesDemo extends StatelessWidget {
  const ShartPerferencesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: _incrementCounter, child: const Text('递增')),
          ElevatedButton(onPressed: _decrementCounter, child: const Text('递减')),
          ElevatedButton(onPressed: _removeCounter, child: const Text('删除')),
          ElevatedButton(onPressed: _addMyContent, child: const Text('设置字符串')),
          ElevatedButton(onPressed: _getMyContent, child: const Text('获取字符串')),
          ElevatedButton(onPressed: _clearContent, child: const Text('清空')),
        ],
      ),
    );
  }

  _incrementCounter() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressd Counter is $counter');
    await prefs.setInt('counter', counter);
  }

  _decrementCounter() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter') ?? 0;
    if (counter > 0) {
      counter--;
    }
    print('Pressd Counter is $counter');
    await prefs.setInt('counter', counter);
  }

  _removeCounter() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('counter');
    int counter = prefs.getInt('counter') ?? 0;
    print('Pressd Counter is $counter');
  }

  _addMyContent() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('hi', 'hello world');
    String content = prefs.getString('hi') ?? '';
    print('set string content is $content');
  }

  _getMyContent() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String content = prefs.getString('hi') ?? '';
    print('get string content is $content');
  }

  _clearContent() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
