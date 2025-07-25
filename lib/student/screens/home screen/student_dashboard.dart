import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/components/greetingcard/greeting_widget.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';

import 'package:school_app/student/data/student_drawer_data.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  // Find the permanent controllers
  final drawerController = Get.find<DrawerControllerCustom>();
  final appBarController = Get.find<AppBarController>();

  @override
  Widget build(BuildContext context) {
    // Initialize controller state (mock data for demo)

    drawerController.setUserName('Sehal Bilal');
    drawerController.setItems(StudentDrawerData.getStudentDrawerItems());
    drawerController.setActiveIndex(0); // Set "Dashboard" as active

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
