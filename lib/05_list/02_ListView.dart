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
      body: const ListViewDemo(),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ListViewBasic(),
          const ListViewHorizontal(),
          ListViewBuilderDemo(),
          ListViewSeperatedDemo()
        ],
      ),
    );
  }
}

class ListViewBasic extends StatelessWidget {
  const ListViewBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          ListTile(
            leading: Icon(
              Icons.access_alarm,
              size: 50,
            ),
            title: Text("access_alarm"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(
              Icons.add_a_photo_outlined,
              size: 50,
            ),
            title: Text("add_a_photo_outlined"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
            selected: true,
            selectedColor: Colors.red,
            selectedTileColor: Colors.lightBlue,
          ),
          ListTile(
            leading: Icon(
              Icons.ac_unit,
              size: 50,
            ),
            title: Text("ac_unit"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(
              Icons.fact_check_outlined,
              size: 50,
            ),
            title: Text("fact_check_outlined"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
          )
        ],
      ),
    );
  }
}

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 160,
            color: Colors.amber,
          ),
          Container(
            width: 160,
            color: Colors.black,
          ),
          Container(
            width: 160,
            color: Colors.blue,
          ),
          Container(
            width: 160,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class ListViewBuilderDemo extends StatelessWidget {
  ListViewBuilderDemo({super.key});

  final List<Widget> users = List<Widget>.generate(20,
      (index) => OutlinedButton(onPressed: () {}, child: Text("姓名 $index")));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: users.length,
        itemExtent: 30,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return users[index];
        },
      ),
    );
  }
}

class ListViewSeperatedDemo extends StatelessWidget {
  ListViewSeperatedDemo({super.key});

  final List<Widget> products = List.generate(
      20,
      (index) => ListTile(
            leading: Image.asset('images/flutter.jpg'),
            title: Text("商品标题 $index"),
            subtitle: const Text("子标题"),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text("商品列表"),
        ),
        Container(
          height: 200,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return products[index];
              },
              // 分隔器的构造器
              separatorBuilder: (context, index) {
                return Divider(
                  color: index % 2 == 0 ? Colors.blue : Colors.red,
                  thickness: 2,
                );
              },
              itemCount: products.length),
        )
      ],
    );
  }
}
