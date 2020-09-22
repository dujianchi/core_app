library baseapp;

import 'package:core_app/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// base MaterialApp
class BaseMaterialApp extends MaterialApp {
  static const duLocalizationsDelegates = const <LocalizationsDelegate>[
    TextsDelegate.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
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
    localizationsDelegates: duLocalizationsDelegates,
    localeListResolutionCallback,
    localeResolutionCallback,
    supportedLocales: Texts.support_locales,
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
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          debugShowMaterialGrid: debugShowMaterialGrid,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        );
}

/// base StatefulWidget
abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key key}) : super(key: key);

  String getContextString(BuildContext context, String key) =>
      Texts().getWithContext(context, stringMaps(), key);
  String getString(String key) => Texts().getString(stringMaps(), key);

  /// 当前页面中需要用到的字符串
  Map<String, Map<String, String>> stringMaps() => const {};
}

/// base StatelessWidget
abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({Key key}) : super(key: key);

  String getContextString(BuildContext context, String key) =>
      Texts().getWithContext(context, stringMaps(), key);
  String getString(String key) => Texts().getString(stringMaps(), key);

  /// 当前页面中需要用到的字符串
  Map<String, Map<String, String>> stringMaps() => const {};
}
