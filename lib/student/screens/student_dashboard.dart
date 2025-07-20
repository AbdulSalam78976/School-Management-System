import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/custom_appbar_widget.dart';
import 'package:school_app/common/components/custom_drawer.dart';
import 'package:school_app/common/components/greeting_widget.dart';
import 'package:school_app/common/controllers/appbar_controller.dart';
import 'package:school_app/common/controllers/drawer_controller.dart';
import 'package:school_app/student/screens/screens_controller/student_dashboard_controller.dart';
import 'package:school_app/student/data/student_drawer_data.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Set up controllers
    final drawerController = Get.put(DrawerControllerCustom());
    final appBarController = Get.put(AppBarController());
    final studentDashboardController = Get.put(StudentDashboardController());

    // Initialize controller state (mock data for demo)
    drawerController.setUserName('Student Name');
    drawerController.setItems(
      StudentDrawerData.getStudentDrawerItems(studentDashboardController),
    );
    appBarController.setTitle('Dashboard');

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
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
