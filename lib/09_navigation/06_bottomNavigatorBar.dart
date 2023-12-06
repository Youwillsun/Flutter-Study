import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    // backgroundColor要生效，需要设置BottomNavigationBar的type为BottomNavigationBarType.shifting
    const BottomNavigationBarItem(
        backgroundColor: Colors.blue, icon: Icon(Icons.home), label: '首页'),
    const BottomNavigationBarItem(
        backgroundColor: Colors.green, icon: Icon(Icons.message), label: '消息'),
    const BottomNavigationBarItem(
        backgroundColor: Colors.amber,
        icon: Icon(Icons.shopping_cart),
        label: '购物车'),
    const BottomNavigationBarItem(
        backgroundColor: Colors.red, icon: Icon(Icons.person), label: '我的'),
  ];

  final List<Center> pages = [
    const Center(
      child: Text("Home", style: TextStyle(fontSize: 50)),
    ),
    const Center(
      child: Text("Message", style: TextStyle(fontSize: 50)),
    ),
    const Center(
      child: Text("Cart", style: TextStyle(fontSize: 50)),
    ),
    const Center(
      child: Text("Profile", style: TextStyle(fontSize: 50)),
    )
  ];

  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("首页"),
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.settings)],
          elevation: 1,
          centerTitle: true),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
