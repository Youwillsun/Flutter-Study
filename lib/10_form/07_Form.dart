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
      body: const FormDemo(),
    );
  }
}

class FormDemo extends StatefulWidget {
  const FormDemo({super.key});

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _phone;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(hintText: "手机号"),
              validator: (value) {
                RegExp reg = new RegExp(r'^\d{11}$');
                if (!reg.hasMatch(value!)) {
                  return '手机号非法$value';
                }
                return null;
              },
              onSaved: (value) {
                print('_phone onSaved');
                _phone = value;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(hintText: "密码"),
              validator: (value) {
                return value!.length < 6 ? '密码长度不够' : null;
              },
              onSaved: (value) {
                print('_password onSaved');
                _password = value;
              },
            ),
          ]),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('提交成功');
                    // 提交表单
                    print('_formKey.currentState!.save() before');
                    _formKey.currentState!.save();
                    print('_formKey.currentState!.save() after');
                    print(_phone);
                    print(_password);
                  }
                },
                child: Text('提交'),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.reset();
                },
                child: Text('重置'),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
