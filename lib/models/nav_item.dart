import 'package:flutter/cupertino.dart';

class NavItem {
  final String title;
  final IconData icon;
  final Widget screen;

  const NavItem({
    required this.title,
    required this.icon,
    required this.screen,
  });
}


