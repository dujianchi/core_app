class Str {
  /// string -> num
  static num toNum(String str, [num def]) {
    if (str?.isNotEmpty == true) {
      return num.tryParse(str) ?? def;
    }
    return def;
  }

  /// string -> int
  static int toInt(String str, [num def]) => toNum(str, def)?.toInt();

  /// string -> double
  static double toDouble(String str, [num def]) => toNum(str, def)?.toDouble();

  /// string -> bool
  static bool toBool(String str) {
    return str == 'true' || str == '1' || str == '1.0';
  }
}
