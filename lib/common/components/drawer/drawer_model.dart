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

  DrawerModel copyWith({
    IconData? icon,
    String? title,
    VoidCallback? onTap,
    bool? isActive,
  }) {
    return DrawerModel(
      icon: icon ?? this.icon,
      title: title ?? this.title,
      onTap: onTap ?? this.onTap,
      isActive: isActive ?? this.isActive,
    );
  }
}
