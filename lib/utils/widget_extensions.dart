import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget wrapCenter() => Center(
        child: this,
      );

  Widget flexible({int flex = 1}) => Flexible(
    flex: flex,
    child: this,
  );

  Widget expanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );

  Widget paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget paddingWithSymmetry({
    double vertical = 0,
    double horizontal = 0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      child: this,
    );
  }

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

  Widget asGestureButton({
    void Function()? onClick,
    void Function()? onDoubleClick,
    void Function()? onLongPressUp,
    void Function(LongPressDownDetails downDetails)? onLongPressDown,
  }) {
    return GestureDetector(
      onTap: onClick,
      onLongPressUp: onLongPressUp,
      onLongPressDown: onLongPressDown,
      onLongPressCancel: onLongPressUp,
      onLongPress: () {
        print("zeeshan onLongPress");
      },
      child: this,
    );
  }

  Widget withSize(double size) {
    return SizedBox(
      height: size,
      width: size,
      child: this,
    );
  }
}
