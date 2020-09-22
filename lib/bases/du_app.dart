import 'package:core_app/core.dart';
import 'package:flutter/material.dart';

import 'base_app.dart';

abstract class DuStatefulWidget extends BaseStatefulWidget
    with _ShowSomething
    implements Toast {
  DuStatefulWidget({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void toastSnackBar({
    SnackBar snackBar,
    Widget content,
    String text,
    Color backgroundColor,
    double elevation,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
    double width,
    ShapeBorder shape,
    SnackBarBehavior behavior,
    SnackBarAction action,
    Duration duration,
    Animation<double> animation,
    VoidCallback onVisible,
    String hideStr,
  }) {
    _showSnackBar(
      scaffoldKey: _scaffoldKey,
      snackBar: snackBar,
      content: content,
      text: text,
      backgroundColor: backgroundColor,
      elevation: elevation,
      margin: margin,
      padding: padding,
      width: width,
      shape: shape,
      behavior: behavior,
      action: action,
      duration: duration,
      animation: animation,
      onVisible: onVisible,
      hideStr: hideStr,
    );
  }
}

abstract class DuStatelessWidget extends BaseStatelessWidget
    with _ShowSomething
    implements Toast {
  DuStatelessWidget({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void toastSnackBar({
    SnackBar snackBar,
    Widget content,
    String text,
    Color backgroundColor,
    double elevation,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
    double width,
    ShapeBorder shape,
    SnackBarBehavior behavior,
    SnackBarAction action,
    Duration duration,
    Animation<double> animation,
    VoidCallback onVisible,
    String hideStr,
  }) {
    _showSnackBar(
      scaffoldKey: _scaffoldKey,
      snackBar: snackBar,
      content: content,
      text: text,
      backgroundColor: backgroundColor,
      elevation: elevation,
      margin: margin,
      padding: padding,
      width: width,
      shape: shape,
      behavior: behavior,
      action: action,
      duration: duration,
      animation: animation,
      onVisible: onVisible,
    );
  }
}

abstract class Toast {
  void toastSnackBar({
    SnackBar snackBar,
    Widget content,
    String text,
    Color backgroundColor,
    double elevation,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
    double width,
    ShapeBorder shape,
    SnackBarBehavior behavior,
    SnackBarAction action,
    Duration duration,
    Animation<double> animation,
    VoidCallback onVisible,
    String hideStr,
  });
}

class _ShowSomething {
  void _showSnackBar({
    GlobalKey<ScaffoldState> scaffoldKey,
    SnackBar snackBar,
    Widget content,
    String text,
    Color backgroundColor,
    double elevation,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
    double width,
    ShapeBorder shape,
    SnackBarBehavior behavior,
    SnackBarAction action,
    Duration duration,
    Animation<double> animation,
    VoidCallback onVisible,
    String hideStr,
  }) {
    final SnackBarAction actionOrHide = action != null
        ? action
        : hideStr?.isNotEmpty == true
            ? SnackBarAction(
                label: hideStr,
                onPressed: () {
                  scaffoldKey?.currentState?.hideCurrentSnackBar();
                },
              )
            : null;
    SnackBar show;
    if (snackBar != null) {
      show = snackBar;
    } else {
      var contentWidget = content != null ? content : Text('$text');
      show = SnackBar(
        content: contentWidget,
        backgroundColor: backgroundColor,
        elevation: elevation,
        margin: margin,
        padding: padding,
        width: width,
        shape: shape,
        behavior: behavior ?? SnackBarBehavior.floating,
        action: actionOrHide,
        duration: duration ?? const Duration(seconds: 3),
        animation: animation,
        onVisible: onVisible,
      );
    }
    scaffoldKey?.currentState?.showSnackBar(show);
  }
}
