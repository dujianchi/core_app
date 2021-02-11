extension DuStringUtils on String {
  /// to num
  num? toNum([num? def]) =>
      this?.isNotEmpty == true ? num.tryParse(this) ?? def : def;

  /// to int
  int? toInt([int? def]) => toNum(def)?.round() ?? def;

  /// to double
  double? toDouble([double? def]) => toNum(def)?.toDouble() ?? def;

  /// to bool
  bool toBool() =>
      'true' == this ||
      '1' == this ||
      (this?.isNotEmpty == true &&
          ('true' == this.toLowerCase() || 'yes' == this.toLowerCase())) ||
      toInt(-1)! >= 1;
}
