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
      body: const UserList(),
    );
  }
}

class User {
  String name;
  int age;
  bool selected;
  User(this.name, this.age, {this.selected = false});
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> data = [
    User('张三', 18),
    User('张三丰', 218, selected: true),
    User('张翠山', 30),
    User('张无忌', 60),
  ];

  bool _sortAscending = true;

  List<DataRow> _getUserRows() {
    List<DataRow> dataRows = [];

    for (int i = 0; i < data.length; i++) {
      dataRows.add(DataRow(
          selected: data[i].selected,
          onSelectChanged: (selected) {
            setState(() {
              data[i].selected = selected!;
            });
          },
          cells: [
            DataCell(Text(data[i].name)),
            DataCell(Text(data[i].age.toString())),
            const DataCell(Text('男')),
            const DataCell(Text('---')),
          ]));
    }

    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            sortColumnIndex: 1,
            sortAscending: _sortAscending,
            horizontalMargin: 20,
            columnSpacing: 80,
            columns: [
              const DataColumn(label: Text('姓名')),
              DataColumn(
                  label: const Text('年龄'),
                  numeric: true,
                  onSort: (int columnIndex, bool asscending) {
                    setState(() {
                      _sortAscending = asscending;
                      if (asscending) {
                        data.sort((a, b) => a.age.compareTo(b.age));
                      } else {
                        data.sort((a, b) => b.age.compareTo(a.age));
                      }
                    });
                  }),
              const DataColumn(label: Text('性别')),
              const DataColumn(label: Text('简介'))
            ],
            rows: _getUserRows(),
          )),
    );
  }
}
