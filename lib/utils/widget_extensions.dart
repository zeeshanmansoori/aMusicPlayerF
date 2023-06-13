import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget expanded() => Expanded(
        child: this,
      );

  Widget padding({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        left,
        top,
        right,
        bottom,
      ),
      child: this,
    );
  }

  Widget asButton({
    void Function()? onClick,
    void Function()? onDoubleClick,
  }) {
    return InkWell(
      onTap: onClick,
      onDoubleTap: onDoubleClick,
      child: this,
    );
  }
}
