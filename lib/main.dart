import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './11_other/CustomLocalizations.dart';

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
// import './08_state/01_StatefulWidget.dart';
// import './08_state/02_DataTable.dart';
// import './08_state/03_InheritedWidget.dart';
// import './08_state/04_lifecycle.dart';
// import './08_state/05_Provider.dart';
// import './09_navigation/01_anonymous.dart';
// import './09_navigation/02_namedRoute.dart';
// import './09_navigation/03_onGenerateRoute.dart';
// import './09_navigation/04_arguments.dart';
// import './09_navigation/05_drawer.dart';
// import './09_navigation/06_bottomNavigatorBar.dart';
// import './09_navigation/07_tab.dart';
// import './10_form/01_Switch.dart';
// import './10_form/02_Checkbox.dart';
// import './10_form/03_Radio.dart';
// import './10_form/04_TextField.dart';
// import './10_form/05_Calendart.dart';
// import '10_form/06_Form.dart';
// import './10_form/07_Form.dart';
// import './11_other/01_Animation.dart';
// import './11_other/02_StaggerAnimation.dart';
// import './11_other/03_HeroAnimation.dart';
// import './11_other/04_TextI18n.dart';
import './11_other/05_Theme.dart';
import './11_other/CustomTheme.dart';

void main() {
  runApp(const MyApp());
}

// 为01 - 09_01服务
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: Home(),
      // theme: ThemeData(
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ButtonStyle(
      //       backgroundColor: MaterialStateProperty.all(Colors.red),
      //     ),
      //   ),
      //   textTheme: TextTheme(
      //     titleMedium: TextStyle(
      //       fontSize: 20,
      //     ),
      //   ),
      //   iconTheme: IconThemeData(color: Colors.green, size: 40),
      //   cardTheme: CardTheme(
      //     color: Colors.red,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10),
      //       side: const BorderSide(color: Colors.yellow, width: 3),
      //     ),
      //     elevation: 20
      //   ),
      // ),
      // 适配终端主题风格(使用flutter内置)
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      // 使用自定主题适配
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // 国际化
      localizationsDelegates: {
        // 自定义本地化代理
        CustomLocalizations.delegate,
        // 本地化的代理
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      },
      supportedLocales: [Locale('en', 'US'), Locale('zh', 'CN')],
      localeResolutionCallback: (locale, supportedLocales) {
        print('deiveLocale ${locale}');
        print('languageCode ${locale!.languageCode}');
        print('countryCode ${locale!.countryCode}');
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale!.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Flutter Demo",
//       // 声明命名路由
//       routes: {
//         'home': (context) => Home(),
//         'product': (context) => Product(),
//         'productDetail': (context) => ProductDetail()
//       },
//       initialRoute: 'home',
//       onUnknownRoute: (RouteSettings setting) =>
//           MaterialPageRoute(builder: (context) => UnknowPage()),
//       // theme: ThemeData(fontFamily: 'SourceSans3'),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Flutter Demo",
//       // 动态路由
//       onGenerateRoute: (RouteSettings setting) {
//         // 匹配首页
//         print('当前路径' + setting.name.toString());
//         if (setting.name == '/') {
//           return MaterialPageRoute(builder: (context) => Home());
//         }
//         if (setting.name == '/product') {
//           return MaterialPageRoute(builder: (context) => Product());
//         }

//         // 匹配 /product/:id
//         var uri = Uri.parse(setting.name.toString());
//         print(uri.pathSegments);
//         if (uri.pathSegments.length == 2 &&
//             uri.pathSegments.first == 'product') {
//           var id = uri.pathSegments[1];
//           return MaterialPageRoute(builder: (context) => ProductDetail(id: id));
//         }

//         return MaterialPageRoute(builder: (context) => UnknowPage());
//       },
//       // theme: ThemeData(fontFamily: 'SourceSans3'),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
