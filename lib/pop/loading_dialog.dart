library loadingdialog;

import 'package:core_app/pop/full_screen_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LoadingDialog extends FullScreenDialog {
  static const _default_hint = '加载中';
  static var _isShowing = false;

  static show(BuildContext context,
      {String hintText: _default_hint,
      int timeOutSeconds: 5,
      Color barrierColor}) {
    if (context == null || context.owner == null) return;

    if (barrierColor == null)
      barrierColor = Colors.black45;
    else if (barrierColor == Colors.transparent)
      barrierColor = const Color(0x01000000);

    if (!_isShowing) {
      showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext buildContext, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
          final Widget pageChild = new Builder(
            builder: (_) => LoadingDialog(
                  hintText: hintText,
                  dissmissListener: () {
                    _isShowing = false;
                  },
                ),
          );
          return new SafeArea(
            child: new Builder(builder: (BuildContext context) {
              return theme != null
                  ? new Theme(data: theme, child: pageChild)
                  : pageChild;
            }),
          );
        },
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: barrierColor,
        transitionDuration: const Duration(milliseconds: 150),
        transitionBuilder: _buildMaterialDialogTransitions,
      );
      // showDialog(
      //   context: context,
      //   builder: (_) => LoadingDialog(
      //         hintText: hintText,
      //         dissmissListener: () {
      //           _isShowing = false;
      //         },
      //       ),
      // );
      _isShowing = true;
      if (timeOutSeconds != null && timeOutSeconds > 0) {
        Future.delayed(
          Duration(seconds: timeOutSeconds),
          () {
            dismiss(context);
          },
        );
      }
    }
  }

  static Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return new FadeTransition(
      opacity: new CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  ///将此方法设为异步方法，后面如果需要跳转或弹出界面的，需要await此方法，才能完美使用pop方法
  static Future<bool> dismiss(BuildContext context) async {
    if (_isShowing && context != null) {
      try {
        Navigator.of(context, rootNavigator: true).maybePop();
        _isShowing = false;
      } catch (e) {
        debugPrint('get error when dismiss, error = $e');
      }
    }
    return _isShowing;
  }

  static get isShowing => _isShowing;

  LoadingDialog(
      {String hintText: _default_hint, OnDissmissListener dissmissListener})
      : super(
            child: Center(
                child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Container(
                    child: Text(
                      '$hintText',
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    margin: EdgeInsets.only(top: 10.0),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20.0),
              height: 120.0,
              width: 120.0,
            )),
            dissmissListener: dissmissListener);
}
