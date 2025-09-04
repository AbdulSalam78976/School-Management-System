import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/data/api_service.dart';
import 'package:school_app/common/utils/sessionmanager.dart';
import 'package:school_app/common/utils/utils.dart';
import '../../../resources/routes/route_names.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var obscureText = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  @override
  void onClose() {
    // Don't dispose controllers here to avoid the error
    // The GetX controller lifecycle handles this automatically
    super.onClose();
  }

  Future<void> login() async {
    final api = ApiService();
    isLoading.value = true;

    try {
      final result = await api.post("/auth/login", {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      }, requireAuth: false);

      if (result.isSuccess) {
        final data = result.data as Map<String, dynamic>;
        final token = data['token'] as String?;

        if (token != null) {
          // Save token
          await SessionManager.saveToken(token);

          // ✅ Centralized role-based navigation
          await SessionManager.navigateBasedOnRole();
        } else {
          Utils.snackBar(title: "Error", message: "Invalid credentials");
        }
      } else {
        Utils.snackBar(title: "Error", message: result.error ?? "Login failed");
      }
    } catch (e) {
      Utils.snackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
