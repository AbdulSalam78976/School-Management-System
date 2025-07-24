import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // Reactive profile image
  final Rx<File?> profileImage = Rx<File?>(null);

  // Controller for new password input
  final TextEditingController passwordController = TextEditingController();

  // Method to pick a new profile image
  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedImage != null) {
      profileImage.value = File(pickedImage.path);
    }
  }

  // Method to update password
  void updatePassword() {
    final newPassword = passwordController.text.trim();

    if (newPassword.isEmpty) {
      Get.snackbar('Error', 'Password cannot be empty');
      return;
    }

    // TODO: Add actual backend logic here
    Get.back(); // Close dialog
    Get.snackbar('Success', 'Password updated successfully');
    passwordController.clear();
  }

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }
}
