import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomLocalizations {
  final Locale locale;

  CustomLocalizations(this.locale);

  static final Map<String, Map<String, String>> _localizedValues = {
    "en": {"title": "Home", "greet": "Hello"},
    "zh": {"title": "首页", "greet": "你好"},
  };

  String t(String key) {
    // _localizedValues['zh']['title']
    return _localizedValues[locale.languageCode]![key] ?? "";
  }

  static CustomLocalizations of(BuildContext context) {
    return Localizations.of(context, CustomLocalizations);
  }

  static CustomLocalizationsDelegate delegate = CustomLocalizationsDelegate();
}

// 代理类
class CustomLocalizationsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  Future<CustomLocalizations> load(Locale locale) {
    print(locale.languageCode);
    // TODO: implement load
    return SynchronousFuture(CustomLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<CustomLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}