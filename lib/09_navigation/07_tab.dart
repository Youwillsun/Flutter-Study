import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 菜单数据
    final List<Widget> _tabs = [
      const Tab(
        text: "首页",
        icon: Icon(Icons.home),
      ),
      const Tab(
        text: "添加",
        icon: Icon(Icons.add),
      ),
      const Tab(
        text: "搜索",
        icon: Icon(Icons.search),
      ),
    ];

    // 页面数组
    final List<Widget> _tabViews = [
      const Icon(Icons.home, size: 120, color: Colors.red),
      const Icon(Icons.add, size: 120, color: Colors.green),
      const Icon(Icons.search, size: 120, color: Colors.black),
    ];

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab"),
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.settings)],
          elevation: 1,
          centerTitle: true,
          bottom: TabBar(
            tabs: _tabs,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.amber,
            indicatorWeight: 5,
          ),
        ),
        body: TabBarView(
          children: _tabViews,
        ),
        bottomNavigationBar: TabBar(
          tabs: _tabs,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
        ),
      ),
    );
  }
}
