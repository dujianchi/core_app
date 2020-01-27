import 'package:core_app/core.dart';
import 'package:flutter/material.dart';

abstract class DuPage extends BaseStatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnackBar({SnackBar snackBar, Widget content, String text}) {
    SnackBar show;
    if (snackBar != null) {
      show = snackBar;
    } else if (content != null) {
      show = SnackBar(
        content: content,
      );
    } else if (text?.isNotEmpty == true) {
      show = SnackBar(
        content: Text('$text'),
      );
    }
    if (show != null) {
      _scaffoldKey.currentState?.showSnackBar(show);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(context),
        body: buildChild(context),
      );

  /// build app bar
  Widget buildAppBar(BuildContext context) => null;

  /// build child
  Widget buildChild(BuildContext context);
}
