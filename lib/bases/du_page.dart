import 'package:core_app/core.dart';
import 'package:flutter/material.dart';

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
