import 'package:core_app/core.dart';
import 'package:flutter/material.dart';

class BaseDialog extends BaseStatelessWidget {
  final WidgetBuilder builder;
  final double? padding;
  final double? radius;

  BaseDialog(this.builder, {this.padding, this.radius});

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          child: builder(context),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(radius == null ? 10.0 : radius!))),
          padding: EdgeInsets.all(padding == null ? 10.0 : padding!),
        ),
      );
}
