import 'package:flutter/material.dart';

class CustomTheme {
  // 公共样式
  static const double _CardBorderWidth = 3;
  static const double _CardElevation = 20;

  // 高亮主题
  static final ThemeData lightTheme = ThemeData(
    cardTheme: CardTheme(
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.yellow, width: _CardBorderWidth),
      ),
      elevation: _CardElevation,
    ),
  );

  // 黑暗主题
  static final ThemeData darkTheme = ThemeData(
    cardTheme: CardTheme(
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.red, width: _CardBorderWidth),
      ),
      elevation: _CardElevation,
    ),
  );
}
