/// 等比缩放的屏幕适配方案
class Dimens {
  static final Dimens _instance = Dimens._internal();
  Dimens._internal();
  factory Dimens() => _instance;

  static Dimens get instance => _instance;

  static set screenSize(double screenSize) =>
      _instance._screenSize = screenSize;

  static set designWidth(double designWidth) =>
      _instance._designWidth = designWidth;

  double _screenSize, _designWidth;

  double of(double px) =>
      _designWidth == 0 ? px / 2 : _screenSize * px / _designWidth;

  int ofInt(double px) => of(px).round();
}
