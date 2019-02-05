
/// 等比缩放的屏幕适配方案
class Dimens {
  final double screenSize;
  Dimens(this.screenSize);
  double of(double px, int width) => screenSize * px / width;
  int ofInt(double px, int width) => of(px, width).round();
}
