library baseapp;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:async';
import 'package:flutter/foundation.dart' show SynchronousFuture;

/// base MaterialApp
class BaseMaterialApp extends MaterialApp {
  ///
  /// 需要支持的语言编码和国家编码
  ///
  static const _supportedLocales = const [
    const Locale('en', 'US'),
    const Locale('zh', 'CN'),
  ];

  BaseMaterialApp({
    Key key,
    navigatorKey,
    home,
    routes: const <String, WidgetBuilder>{},
    initialRoute,
    onGenerateRoute,
    onUnknownRoute,
    navigatorObservers: const <NavigatorObserver>[],
    builder,
    title: '',
    onGenerateTitle,
    color,
    theme,
    locale,
    localizationsDelegates,
    localeResolutionCallback,
    supportedLocales: _supportedLocales,
    debugShowMaterialGrid: false,
    showPerformanceOverlay: false,
    checkerboardRasterCacheImages: false,
    checkerboardOffscreenLayers: false,
    showSemanticsDebugger: false,
    debugShowCheckedModeBanner: true,
  }) : super(
            key: key,
            navigatorKey: navigatorKey,
            home: home,
            routes: routes,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: onUnknownRoute,
            navigatorObservers: navigatorObservers,
            builder: builder,
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: color,
            theme: theme,
            locale: locale,
            localizationsDelegates: localizationsDelegates,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            debugShowMaterialGrid: debugShowMaterialGrid,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner);

  @override
  Iterable<LocalizationsDelegate> get localizationsDelegates {
    return const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      TextsDelegate.delegate,
    ];
  }

  @override
  Iterable<Locale> get supportedLocales => _supportedLocales;
}

/// base StatefulWidget
abstract class BaseStatefulWidget extends StatefulWidget {
  String getContextString(BuildContext context, String key) =>
      Texts().getWithContext(context, stringMaps(), key);
  String getString(String key) => Texts().getString(stringMaps(), key);

  /// 当前页面中需要用到的字符串
  Map<String, Map<String, String>> stringMaps() => const {};

  ///屏幕适配方案工具
  Dimens _dimens;

  ///得到屏幕适配方案工具
  Dimens px(BuildContext context) {
    if (_dimens == null) _dimens = Dimens(MediaQuery.of(context).size.width);
    return _dimens;
  }
}

/// base StatelessWidget
abstract class BaseStatelessWidget extends StatelessWidget {
  String getContextString(BuildContext context, String key) =>
      Texts().getWithContext(context, stringMaps(), key);
  String getString(String key) => Texts().getString(stringMaps(), key);

  /// 当前页面中需要用到的字符串
  Map<String, Map<String, String>> stringMaps() => const {};

  ///屏幕适配方案工具
  Dimens _dimens;

  ///得到屏幕适配方案工具
  Dimens px(BuildContext context) {
    if (_dimens == null) _dimens = Dimens(MediaQuery.of(context).size.width);
    return _dimens;
  }
}

/// init and setup 'en' and 'zh'
class Texts {
  static const String _default_language = 'zh';
  static const _support_language = [_default_language, 'en'];

  Texts._internal();

  static final Texts _instance = Texts._internal();

  factory Texts() => _instance;

  String languageCode = _default_language;

  Texts initLanguageContext(BuildContext context) {
    if (context != null)
      languageCode =
          Localizations.localeOf(context, nullOk: true)?.languageCode;
    if (languageCode == null) languageCode = _default_language;
    return this;
  }

  Texts initLanguageString(String languageCode) {
    if (languageCode != null && languageCode.isNotEmpty)
      this.languageCode = languageCode;
    return this;
  }

  Texts initLanguageLocale(Locale locale) {
    return initLanguageString(locale?.languageCode);
  }

  String getWithContext(BuildContext context,
      Map<String, Map<String, String>> strings, String key) {
    initLanguageContext(context);
    return getString(strings, key);
  }

  String getString(Map<String, Map<String, String>> strings, String key) {
    var texts = strings[languageCode];
    if (texts == null || texts.length == 0) //若是取不到这个map，或者取到了map但值为空，则取默认的map
      texts = strings[_default_language];

    return (texts == null || texts[key] == null)
        ? '$key'//'$key is not exists'
        : texts[key]; //若是取到了map，但没取到对应的key，将返回key
  }
}

/// support 'zh-CN' and 'en-US'
class TextsDelegate extends LocalizationsDelegate<Texts> {
  const TextsDelegate();

  static const TextsDelegate delegate = const TextsDelegate();

  @override
  bool isSupported(Locale locale) =>
      Texts._support_language.contains(locale.languageCode);

  @override
  Future<Texts> load(Locale locale) {
    return SynchronousFuture<Texts>(Texts().initLanguageLocale(locale));
  }

  @override
  bool shouldReload(TextsDelegate old) => (old != this);
}

/// 等比缩放的屏幕适配方案
class Dimens {
  final double screenSize;
  Dimens(this.screenSize);
  double of(double px, int width) => screenSize * px / width;
  int ofInt(double px, int width) => of(px, width).round();
}
