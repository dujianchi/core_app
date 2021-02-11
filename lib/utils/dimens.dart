import 'dart:math';

import 'package:flutter/widgets.dart';

/// 等比缩放的屏幕适配方案
class Dimens {
  static const default_screen_size = 360.0, default_design_width = 720.0;
  static final Dimens _instance = Dimens._internal();
  Dimens._internal();
  factory Dimens() => _instance;

  static Dimens get instance => _instance;

  static EdgeInsets get padding => _instance._padding;

  static set screenSize(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    _instance._screenSize = min(data.size.width, data.size.height);
    _instance._padding = MediaQuery.of(context).padding;
  }

  static set designWidth(double? designWidth) =>
      _instance._designWidth = designWidth ?? default_design_width;

  static void init(BuildContext context, double? designWidth) {
    Dimens.screenSize = context;
    Dimens.designWidth = designWidth;
  }

  static double of(num px) => _instance._of(px);

  static int ofInt(num px) => _instance._ofInt(px);

  double _screenSize = default_screen_size,
      _designWidth = default_design_width;

  EdgeInsets _padding = EdgeInsets.zero;

  // final Map<num, Map<num, num>> caches = {};
  // double _of(num px) {
  //   var forScreen = caches[_screenSize];
  //   if (forScreen == null) {
  //     forScreen = {};
  //     caches[_screenSize] = forScreen;
  //   }
  //   double result = forScreen[px];
  //   if (result == null) {
  //     result = _screenSize * px / _designWidth;
  //     forScreen[px] = result;
  //   }
  //   return result;
  // }

  double _of(num px) {
    return _screenSize * px / _designWidth;
  }

  int _ofInt(num px) => _of(px).round();
}
