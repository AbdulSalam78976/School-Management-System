import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  /// Show a custom snackbar
  static void snackBar(
    String title,
    String message, {
    Color? backgroundColor,
    IconData? icon,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor ?? Colors.black87,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      icon: icon != null ? Icon(icon, color: Colors.white) : null,
      duration: const Duration(seconds: 3),
    );
  }

  /// Validate email format
  static bool isEmail(String email) {
    return GetUtils.isEmail(email);
  }
}
