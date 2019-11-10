import 'package:intl/intl.dart';

class Tools {
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

  /// 格式化日期，time为null则使用当前时间，format为null则使用yyyy-MM-dd HH:mm:ss
  static String formatDate({String format, DateTime time}) {
    return DateFormat(format ?? 'yyyy-MM-dd HH:mm:ss')
        .format(time ?? DateTime.now());
  }
}
