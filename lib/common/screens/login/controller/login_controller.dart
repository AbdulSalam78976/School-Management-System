import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/routes/route_names.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable for loading state (optional)
  var isLoading = false.obs;
  var obscureText = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

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

    // Simulate login process (replace with your actual login logic)
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      // Navigate to the dashboard screen
      Get.toNamed(RouteName.teacherHomeScreen);
    });
  }
}
