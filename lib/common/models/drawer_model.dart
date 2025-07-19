import 'package:flutter/material.dart';

class DrawerModel {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const DrawerModel({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isActive,
  });
}
