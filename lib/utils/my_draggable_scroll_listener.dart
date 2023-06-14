import 'package:flutter/material.dart';

class MyDraggableScrollListener extends DraggableScrollableController{
  double bottom = 0;
  double _last = 0;

  MyDraggableScrollListener.initialise(ScrollController controller, [double height = 80]) {
    controller.addListener(() {
      final current = controller.offset;
      bottom += _last - current;
      if (bottom <= -height) bottom = -height;
      if (bottom >= 0) bottom = 0;
      _last = current;
      if (bottom <= 0 && bottom >= -height) notifyListeners();
    });
  }
}
