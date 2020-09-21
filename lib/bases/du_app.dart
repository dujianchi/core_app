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
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    SnackBarAction action,
    Duration duration,
    Animation<double> animation,
    VoidCallback onVisible,
  }) {
    final SnackBarAction actionOrHide = action != null
        ? action
        : SnackBarAction(
            label: '知道了',
            onPressed: () {
              scaffoldKey?.currentState?.hideCurrentSnackBar();
            },
          );
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
        behavior: behavior,
        action: actionOrHide,
        duration: duration ?? const Duration(seconds: 3),
        animation: animation,
        onVisible: onVisible,
      );
    }
    if (show != null) {
      scaffoldKey?.currentState?.showSnackBar(show);
    }
  }
}
