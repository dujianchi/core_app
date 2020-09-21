import 'package:core_app/core.dart';
import 'package:flutter/material.dart';

/// 作为主要的界面，继承于StatelessWidget
abstract class DuPage extends DuStatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        appBar: buildAppBar(context),
        body: buildChild(context),
      );

  /// build app bar
  Widget buildAppBar(BuildContext context) => null;

  /// build child
  Widget buildChild(BuildContext context);
}

/// 作为主要的state类继承于State
abstract class DuState<T extends DuStatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) => Scaffold(
        key: widget.scaffoldKey,
        appBar: buildAppBar(context),
        body: buildChild(context),
      );

  void showSnackBar({SnackBar snackBar, Widget content, String text}) {
    widget.showSnackBar(snackBar: snackBar, content: content, text: text);
  }

  /// build app bar
  Widget buildAppBar(BuildContext context) => null;

  /// build child
  Widget buildChild(BuildContext context);
}
