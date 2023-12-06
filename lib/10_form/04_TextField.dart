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
      body: const TextFieldDemo(),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  String? phone;
  String? password;
  String? description;

  _register() {
    print(phone);
    print(password);
    print(description);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone_outlined),
              labelText: "手机号",
              hintText: "请输入手机号",
              hintStyle: TextStyle(color: Colors.green, fontSize: 12),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow),
              ),
            ),
            maxLength: 11,
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
          TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.code_outlined),
              labelText: "密码",
              hintText: "请输入密码",
            ),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          TextField(
            maxLines: 5,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: "简介",
              hintText: "介绍一下自己",
            ),
            onChanged: (value) {
              setState(() {
                description = value;
              });
            },
          ),
          // 声明按钮
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _register();
              },
              child: Text('提交'),
            ),
          ),
        ],
      ),
    );
  }
}
