import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GreetingController extends GetxController {
  final RxString greeting = ''.obs;
  final RxString formattedDate = ''.obs;
  final RxString name = ''.obs;

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _setGreeting();
    _setFormattedDate();
    fetchName(); // Call the API to load name
  }

  void _setGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      greeting.value = 'Good Morning';
    } else if (hour < 17) {
      greeting.value = 'Good Afternoon';
    } else {
      greeting.value = 'Good Evening';
    }
  }

  void _setFormattedDate() {
    final now = DateTime.now();
    formattedDate.value = DateFormat('d MMM, yyyy').format(now);
  }

  Future<void> fetchName() async {
    try {
      isLoading.value = true;

      // 🔁 Mock API delay
      await Future.delayed(const Duration(seconds: 2));

      // ✅ Mock response
      final fetchedName = 'Abdul Salam'; // Replace this with actual API call

      name.value = fetchedName;
      error.value = '';
    } catch (e) {
      error.value = 'Failed to load name';
    } finally {
      isLoading.value = false;
    }
  }
}
