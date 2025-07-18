import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/resources/theme/app_theme.dart';
import 'package:school_app/common/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School App',
      theme: AppTheme,
      home: LoginScreen(),
    );
  }
}
