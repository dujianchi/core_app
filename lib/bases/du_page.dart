import 'dart:math';

import 'package:core_app/core.dart';
import 'package:flutter/material.dart';

/// 作为主要的界面，继承于StatelessWidget
/// 内部使用了Scaffold，不能作为所有控件的父类
abstract class DuPage extends BaseStatelessWidget
    with DuScaffoldMethod, _ShowSomething
    implements Toast {
  final bool useScaffold;
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  /// 当`useScaffold`为false时，只有`buildChild`方法有效，其余所有方法都无效
  DuPage({Key key, this.useScaffold = true, this.parentScaffoldKey})
      : super(key: key);

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
      scaffoldKey: useScaffold ? _scaffoldKey : parentScaffoldKey,
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

  @override
  Widget build(BuildContext context) => useScaffold
      ? buildView(_scaffoldKey, context, buildChild(context))
      : buildChild(context);

  /// build child
  Widget buildChild(BuildContext context);
}

/// 作为主要的state类继承于State
abstract class DuState<T extends BaseStatefulWidget> extends State<T>
    with DuScaffoldMethod, _ShowSomething
    implements Toast {
  final bool useScaffold;
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  /// 当`useScaffold`为false时，只有`buildChild`方法有效，其余所有方法都无效
  DuState({this.useScaffold = true, this.parentScaffoldKey});

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
      scaffoldKey: useScaffold ? _scaffoldKey : parentScaffoldKey,
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

  @override
  Widget build(BuildContext context) => useScaffold
      ? buildView(_scaffoldKey, context, buildChild(context))
      : buildChild(context);

  /// build child
  Widget buildChild(BuildContext context);
}

///作为默认主页样式
abstract class DuPageBottomNav extends DuPage {
  DuPageBottomNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length:
            min(tabChildren(context).length, tabViewChildren(context).length),
        child: super.build(context),
      );

  @override
  Widget bottomNavigationBar(context) => Material(
        color:
            bottomNavigationBarColor(context) ?? Theme.of(context).primaryColor,
        child: TabBar(
          tabs: tabChildren(context),
        ),
      );

  @override
  Widget buildChild(BuildContext context) => TabBarView(
        children: tabViewChildren(context),
      );

  //tab按钮颜色(位于底部)
  Color bottomNavigationBarColor(BuildContext context) => Colors.white70;

  /// tab内容布局(位于上部)
  List<Widget> tabViewChildren(BuildContext context);

  /// tab按钮布局(位于底部)
  List<Widget> tabChildren(BuildContext context);
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
    if (scaffoldKey == null) return; //如果`scaffoldKey`为null, 下面的代码没有任何意义.
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
    behavior = behavior ?? SnackBarBehavior.floating;
    // if (behavior == SnackBarBehavior.floating &&
    //     margin == null &&
    //     scaffoldKey?.currentContext != null) {
    //   final mediaQuery = MediaQuery.of(scaffoldKey.currentContext);
    //   final padding = mediaQuery.padding;
    //   // final height = mediaQuery.size.height;
    //   margin = EdgeInsets.only(
    //       left: padding.left,
    //       right: padding.right,
    //       bottom: padding.top + padding.bottom + kToolbarHeight);
    // }
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
    scaffoldKey?.currentState?.hideCurrentSnackBar();
    scaffoldKey?.currentState?.showSnackBar(show);
  }
}
