import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // Reactive profile image
  final Rx<File?> profileImage = Rx<File?>(null);

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
  void updatePassword(String newPassword) {
    if (newPassword.isEmpty) {
      Get.snackbar('Error', 'Password cannot be empty');
      return;
    }

    if (newPassword.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters');
      return;
    }

    // TODO: Add actual backend logic here
    Get.snackbar('Success', 'Password updated successfully');
  }

  @override
  void onClose() {
    super.onClose();
  }
}
