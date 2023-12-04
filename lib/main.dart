import 'package:flutter/material.dart';
// import './01_basic/01_Hello.dart';
// import './01_basic/02_Text.dart';
// import './02_layout/01_Container.dart';
// import './02_layout/02_Column_Row.dart';
// import './02_layout/03_Flex.dart';
// import './02_layout/04_Wrap.dart';
// import './02_layout/05_Stack.dart';
// import './02_layout/06_Card.dart';
// import './03_button/01_Button.dart';
// import './04_image/01_image.dart';
// import './05_list/01_SingleChildScrollView.dart';
// import './05_list/02_ListView.dart';
// import './05_list/03_GridView.dart';
// import './05_list/04_GridView.dart';
// import './06_others/01_Cupertino.dart';
// import './07_third-party/01_dio.dart';
// import './07_third-party/02_flutter_swiper.dart';
// import './07_third-party/03_shared_preferences.dart';
import './08_state/01_StatefulWidget.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Demo",
      home: Home(),
      // theme: ThemeData(fontFamily: 'SourceSans3'),
      debugShowCheckedModeBanner: false,
    );
  }
}
