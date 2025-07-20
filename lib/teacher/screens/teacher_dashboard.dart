import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/custom_card_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/components/greetingcard/greeting_widget.dart';
import 'package:school_app/common/components/section_header_with_action.dart';
import 'package:school_app/common/components/upcoming%20classes/upcoming_class_tile.dart';
import 'package:school_app/common/components/upcoming%20classes/upcoming_classes_widget.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/teacher/screens/screens%20controller/teacher_dashboard_controller.dart';
import 'package:school_app/teacher/data/teacher_drawer_data.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Set up controllers
    final drawerController = Get.put(DrawerControllerCustom());
    final appBarController = Get.put(AppBarController());
    final teacherDashboardController = Get.put(TeacherDashboardController());

    // Initialize controller state (mock data for demo)
    drawerController.setUserName('Abdul Salam');

    drawerController.setItems(
      TeacherDrawerData.getTeacherDrawerItems(teacherDashboardController),
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
              children: [
                const GreetingWidget(),
                const SizedBox(height: 10),
                UpcomingClassesWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
