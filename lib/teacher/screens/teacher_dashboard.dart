import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_app/common/components/custom_appbar_widget.dart';
import 'package:school_app/common/components/custom_drawer.dart';
import 'package:school_app/common/components/greeting_widget.dart';
import 'package:school_app/common/utils/utils.dart';
import 'package:school_app/teacher/screens/screens%20controller/teacher_dashboard_controller.dart';
import 'package:school_app/teacher/data/teacher_drawer_data.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TeacherDashboardController drawerController = Get.put(
      TeacherDashboardController(),
    );

    return Scaffold(
      drawer: Obx(
        () => CustomDrawer(
          userName: 'Harper',
          userProfileImage: 'assets/images/ms_harper.png',
          items: TeacherDrawerData.getTeacherDrawerItems(drawerController),
          onLogout: () {
            // Handle teacher logout
            Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
      ),
      appBar: CustomAppBar(text: "Dashboard"),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const GreetingWidget(), const SizedBox(height: 30)],
            ),
          ),
        ),
      ),
    );
  }
}
