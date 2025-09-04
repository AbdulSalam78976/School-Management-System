import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/common/utils/sessionmanager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await SessionManager.isLoggedIn();
    if (isLoggedIn) {
      await SessionManager.navigateBasedOnRole();
    } else {
      Get.offNamed(RouteName.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => _navigate());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppPalette.backgroundColor, AppPalette.accentColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/school.svg",
                width: 180,
                height: 180,
              ),
              const SizedBox(height: 20),
              const Text(
                "School App",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
