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
      body: const CalendarDemo(),
    );
  }
}

class CalendarDemo extends StatefulWidget {
  const CalendarDemo({super.key});

  @override
  State<CalendarDemo> createState() => _CalendarDemoState();
}

class _CalendarDemoState extends State<CalendarDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          _showDatePicker(context)
        ],
      ),
    );
  }
}

ElevatedButton _showDatePicker(context) {
  return ElevatedButton(
      onPressed: () {
        showDatePicker(
            context: context,
            initialDatePickerMode: DatePickerMode.day, // 天数
            initialDate: DateTime.now(), // 初始化选中日期
            firstDate: DateTime(2020, 6), // 开始日期
            lastDate: DateTime(2025, 6), // 结束日期
            initialEntryMode: DatePickerEntryMode.calendar, // 日期弹窗样式

            currentDate: DateTime.now(), // 当前日期
            helpText: "日期选择器",
            cancelText: "取消",
            confirmText: "确认",
            errorFormatText: "errorFormatText", //格式错误提示
            errorInvalidText: "errorInvalidText", // 输入日期不在 firstDate和lastDate之间
            fieldLabelText: "fieldLabelText", // 输入框上方提示
            fieldHintText: "fieldHintText", // 输入框为空时内部提示
            useRootNavigator: true, // 是否为根导航器

            // 设置不可选日期
            selectableDayPredicate: (dayTime) {
              if (dayTime == DateTime(2021, 1, 15)) {
                return false;
              }
              return true;
            });
      },
      child: Text('showDatePicker'));
}