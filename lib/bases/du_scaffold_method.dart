import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DuScaffoldMethod {
  /// build app bar
  PreferredSizeWidget appBar(BuildContext context) => null;

  Widget floatingActionButton(BuildContext context) => null;
  FloatingActionButtonLocation floatingActionButtonLocation(
          BuildContext context) =>
      null;
  FloatingActionButtonAnimator floatingActionButtonAnimator(
          BuildContext context) =>
      null;
  List<Widget> persistentFooterButtons(BuildContext context) => null;
  Widget drawer(BuildContext context) => null;
  Widget endDrawer(BuildContext context) => null;
  Widget bottomNavigationBar(BuildContext context) => null;
  Widget bottomSheet(BuildContext context) => null;
  Color backgroundColor(BuildContext context) => null;
  bool resizeToAvoidBottomInset(BuildContext context) => null;
  bool primary(BuildContext context) => true;
  DragStartBehavior drawerDragStartBehavior(BuildContext context) =>
      DragStartBehavior.start;
  bool extendBody(BuildContext context) => false;
  bool extendBodyBehindAppBar(BuildContext context) => false;
  Color drawerScrimColor(BuildContext context) => null;
  double drawerEdgeDragWidth(BuildContext context) => null;
  bool drawerEnableOpenDragGesture(BuildContext context) => true;
  bool endDrawerEnableOpenDragGesture(BuildContext context) => true;

  Widget buildView(
    Key scaffoldKey,
    BuildContext context,
    Widget body,
  ) =>
      Scaffold(
        key: scaffoldKey,
        appBar: this.appBar(context),
        body: body,
        floatingActionButton: this.floatingActionButton(context),
        floatingActionButtonLocation:
            this.floatingActionButtonLocation(context),
        floatingActionButtonAnimator:
            this.floatingActionButtonAnimator(context),
        persistentFooterButtons: this.persistentFooterButtons(context),
        drawer: this.drawer(context),
        endDrawer: this.endDrawer(context),
        bottomNavigationBar: this.bottomNavigationBar(context),
        bottomSheet: this.bottomSheet(context),
        backgroundColor: this.backgroundColor(context),
        resizeToAvoidBottomInset: this.resizeToAvoidBottomInset(context),
        primary: this.primary(context),
        drawerDragStartBehavior: this.drawerDragStartBehavior(context),
        extendBody: this.extendBody(context),
        extendBodyBehindAppBar: this.extendBodyBehindAppBar(context),
        drawerScrimColor: this.drawerScrimColor(context),
        drawerEdgeDragWidth: this.drawerEdgeDragWidth(context),
        drawerEnableOpenDragGesture: this.drawerEnableOpenDragGesture(context),
        endDrawerEnableOpenDragGesture:
            this.endDrawerEnableOpenDragGesture(context),
      );
  // // 在字类实现下面一段代码，可以让vscode更方便的提示继承的方法，但是失去了意义
  // // ------------ 这么一大段，没有实际意义，只是为了让vscode更好重写对应方法 (begin) ------------
  // @override
  // PreferredSizeWidget buildAppBar(BuildContext context) =>
  //     super.buildAppBar(context);

  // @override
  // Widget floatingActionButton(BuildContext context) =>
  //     super.floatingActionButton(context);
  // @override
  // FloatingActionButtonLocation floatingActionButtonLocation(
  //         BuildContext context) =>
  //     super.floatingActionButtonLocation(context);
  // @override
  // FloatingActionButtonAnimator floatingActionButtonAnimator(
  //         BuildContext context) =>
  //     super.floatingActionButtonAnimator(context);
  // @override
  // List<Widget> persistentFooterButtons(BuildContext context) =>
  //     super.persistentFooterButtons(context);
  // @override
  // Widget drawer(BuildContext context) => super.drawer(context);
  // @override
  // Widget endDrawer(BuildContext context) => super.endDrawer(context);
  // @override
  // Widget bottomNavigationBar(BuildContext context) =>
  //     super.bottomNavigationBar(context);
  // @override
  // Widget bottomSheet(BuildContext context) => super.bottomSheet(context);
  // @override
  // Color backgroundColor(BuildContext context) => super.backgroundColor(context);
  // @override
  // bool resizeToAvoidBottomPadding(BuildContext context) =>
  //     super.resizeToAvoidBottomPadding(context);
  // @override
  // bool resizeToAvoidBottomInset(BuildContext context) =>
  //     super.resizeToAvoidBottomInset(context);
  // @override
  // bool primary(BuildContext context) => super.primary(context);
  // @override
  // DragStartBehavior drawerDragStartBehavior(BuildContext context) =>
  //     super.drawerDragStartBehavior(context);
  // @override
  // bool extendBody(BuildContext context) => super.extendBody(context);
  // @override
  // bool extendBodyBehindAppBar(BuildContext context) =>
  //     super.extendBodyBehindAppBar(context);
  // @override
  // Color drawerScrimColor(BuildContext context) =>
  //     super.drawerScrimColor(context);
  // @override
  // double drawerEdgeDragWidth(BuildContext context) =>
  //     super.drawerEdgeDragWidth(context);
  // @override
  // bool drawerEnableOpenDragGesture(BuildContext context) =>
  //     super.drawerEnableOpenDragGesture(context);
  // @override
  // bool endDrawerEnableOpenDragGesture(BuildContext context) =>
  //     super.endDrawerEnableOpenDragGesture(context);
  // // ------------ 这么一大段，没有实际意义，只是为了让vscode更好重写对应方法 (end) ------------
}
