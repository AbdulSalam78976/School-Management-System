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

    isLoading.value = true;
  }
}
