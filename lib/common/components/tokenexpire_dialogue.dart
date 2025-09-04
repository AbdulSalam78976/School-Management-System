import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/utils/sessionmanager.dart';

void showTokenExpiryDialogue() {
  if (Get.isDialogOpen ?? false) return;

  void redirectToLogin() async {
    if (Get.isDialogOpen ?? false) Get.back(); // close dialog
    await SessionManager.clearToken(); // clear token + data

    Get.offAllNamed(RouteName.loginScreen); // go to login
  }

  Get.defaultDialog(
    title: 'Session Expired',
    titleStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.red,
    ),
    middleText: 'Your session has expired.\nPlease login again.',
    textConfirm: 'Login Now',
    confirmTextColor: Colors.white,
    buttonColor: Colors.red,
    radius: 12,
    onConfirm: redirectToLogin,
    barrierDismissible: false,
  );
}
