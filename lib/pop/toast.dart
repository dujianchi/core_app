library toast;

import 'package:core_app/pop/flushbar.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Toast {
  static const Toast _singleton = const Toast._internal();
  const Toast._internal();
  factory Toast() => _singleton;

  static const _duration = const Duration(seconds: 2);

  ///错误提示
  static Future<T> show<T extends Object>(BuildContext context, String message,
      {String actionText, VoidCallback onActionPress}) {
    if (context == null) return Future.any([]);
    return Flushbar<T>(
      message: '$message',
      duration: _duration,
      isDismissible: true,
      // flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
