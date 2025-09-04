import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/resources/bindings/app_binding.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/resources/theme/app_theme.dart';
import 'package:school_app/common/resources/routes/routes.dart';
import 'package:school_app/common/utils/sessionmanager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Restore token expiry watcher
  await SessionManager.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Management App',
      theme: AppTheme,
      initialBinding: AppBinding(),
      initialRoute: RouteName.splashScreen,
      getPages: AppRoutes.appRoutes(),
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const Scaffold(body: Center(child: Text("Page not found"))),
      ),
    );
  }
}
