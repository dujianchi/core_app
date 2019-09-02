import 'package:flutter/widgets.dart';

/// 等比缩放的屏幕适配方案
class Dimens {
  static final Dimens _instance = Dimens._internal();
  Dimens._internal();
  factory Dimens() => _instance;

  static Dimens get instance => _instance;

  static set screenSize(BuildContext context) =>
      _instance._screenSize = MediaQuery.of(context).size.width;

  static set designWidth(double designWidth) =>
      _instance._designWidth = designWidth;

  static double of(double px) => _instance._of(px);

  static int ofInt(double px) => _instance._ofInt(px);

  double _screenSize, _designWidth;

  double _of(double px) =>
      _designWidth == 0 ? px / 2 : _screenSize * px / _designWidth;

  int _ofInt(double px) => _of(px).round();
}
