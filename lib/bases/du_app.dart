import 'package:flutter/material.dart';

import 'base_app.dart';

abstract class DuStatefulWidget extends BaseStatefulWidget {
  DuStatefulWidget({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

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
}

abstract class DuStatelessWidget extends BaseStatelessWidget {
  DuStatelessWidget({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

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
}
