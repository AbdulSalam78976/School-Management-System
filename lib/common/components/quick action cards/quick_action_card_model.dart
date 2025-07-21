import 'package:flutter/material.dart';

class QuickActionCardModel {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  QuickActionCardModel({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}
