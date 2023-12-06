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
      body: const HomePage(),
      drawer: const DrawerList(),
      endDrawer: const DrawerList(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('home')),
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("初六"),
            accountEmail: Text('124456789@qq.com'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bg1.jpg'), fit: BoxFit.cover)),
            currentAccountPicture:
                CircleAvatar(backgroundImage: AssetImage("images/flutter.jpg")),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(thickness: 2),
          const ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('余额'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(thickness: 2),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('我的'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(thickness: 2),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('回退'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.pop(context),
          ),
          AboutListTile(
            child: const Text('关于'),
            applicationName: '你的应用名称',
            applicationVersion: '1.0.0',
            icon: const CircleAvatar(child: Text('aaa')),
            applicationLegalese: "应用法律条款",
            aboutBoxChildren: [
              const Text('条例1：xxxx'),
              const Text('条例2：xxxx'),
            ],
            applicationIcon:
                Image.asset('images/flutter.jpg', width: 50, height: 50),
          )
        ],
      ),
    );
  }
}
