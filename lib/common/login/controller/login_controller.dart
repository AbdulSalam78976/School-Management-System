import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/utils/utils.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable for loading state (optional)
  var isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Utils.snackBar('Error', 'Please enter email and password.');
      return;
    }

    isLoading.value = true;

    // Simulate a login delay
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;

      Get.snackbar(
        'Success',
        'Logged in as $email',
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }
}
