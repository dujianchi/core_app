import 'dart:math';

import 'package:core_app/core.dart';
import 'package:flutter/material.dart';

/// 作为主要的界面，继承于StatelessWidget
/// 内部使用了Scaffold，不能作为所有控件的父类
abstract class DuPage extends BaseStatelessWidget
    with DuScaffoldMethod, _ShowSomething
    implements Toast {
  DuPage({Key key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(context),
        body: buildChild(context),
        floatingActionButton: floatingActionButton(context),
        floatingActionButtonLocation: floatingActionButtonLocation(context),
        floatingActionButtonAnimator: floatingActionButtonAnimator(context),
        persistentFooterButtons: persistentFooterButtons(context),
        drawer: drawer(context),
        endDrawer: endDrawer(context),
        bottomNavigationBar: bottomNavigationBar(context),
        bottomSheet: bottomSheet(context),
        backgroundColor: backgroundColor(context),
        resizeToAvoidBottomPadding: resizeToAvoidBottomPadding(context),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(context),
        primary: primary(context),
        drawerDragStartBehavior: drawerDragStartBehavior(context),
        extendBody: extendBody(context),
        extendBodyBehindAppBar: extendBodyBehindAppBar(context),
        drawerScrimColor: drawerScrimColor(context),
        drawerEdgeDragWidth: drawerEdgeDragWidth(context),
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(context),
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture(context),
      );

  /// build child
  Widget buildChild(BuildContext context);
}

/// 作为主要的state类继承于State
abstract class DuState<T extends BaseStatefulWidget> extends State<T>
    with DuScaffoldMethod, _ShowSomething
    implements Toast {
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

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(context),
        body: buildChild(context),
        floatingActionButton: floatingActionButton(context),
        floatingActionButtonLocation: floatingActionButtonLocation(context),
        floatingActionButtonAnimator: floatingActionButtonAnimator(context),
        persistentFooterButtons: persistentFooterButtons(context),
        drawer: drawer(context),
        endDrawer: endDrawer(context),
        bottomNavigationBar: bottomNavigationBar(context),
        bottomSheet: bottomSheet(context),
        backgroundColor: backgroundColor(context),
        resizeToAvoidBottomPadding: resizeToAvoidBottomPadding(context),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(context),
        primary: primary(context),
        drawerDragStartBehavior: drawerDragStartBehavior(context),
        extendBody: extendBody(context),
        extendBodyBehindAppBar: extendBodyBehindAppBar(context),
        drawerScrimColor: drawerScrimColor(context),
        drawerEdgeDragWidth: drawerEdgeDragWidth(context),
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(context),
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture(context),
      );

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
    scaffoldKey?.currentState?.hideCurrentSnackBar();
    scaffoldKey?.currentState?.showSnackBar(show);
  }
}
