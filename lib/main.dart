import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/resources/bindings/app_binding.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/resources/theme/app_theme.dart';
import 'common/resources/routes/routes.dart';

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
      title: 'School Management App',
      theme: AppTheme,
      initialBinding: AppBinding(),
      initialRoute: RouteName.teacherHomeScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
