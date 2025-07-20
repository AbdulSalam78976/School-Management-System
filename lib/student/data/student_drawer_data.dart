import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/models/drawer_model.dart';
import 'package:school_app/student/screens/screens_controller/student_dashboard_controller.dart';

class StudentDrawerData {
  static List<DrawerModel> getStudentDrawerItems(
    StudentDashboardController controller,
  ) => [
    DrawerModel(
      icon: Icons.dashboard_outlined,
      title: 'Dashboard',
      isActive: controller.activeDrawerIndex.value == 0,
      onTap: () {
        controller.setActiveIndex(0);
        // Navigate to dashboard or stay on current screen
      },
    ),
    DrawerModel(
      icon: Icons.class_outlined,
      title: 'My Classes',
      isActive: controller.activeDrawerIndex.value == 1,
      onTap: () {
        controller.setActiveIndex(1);
        // Navigate to classes screen
        Get.toNamed('/student/classes');
      },
    ),
    DrawerModel(
      icon: Icons.calendar_today_outlined,
      title: 'Attendance',
      isActive: controller.activeDrawerIndex.value == 2,
      onTap: () {
        controller.setActiveIndex(2);
        // Navigate to attendance screen
        Get.toNamed('/student/attendance');
      },
    ),
    DrawerModel(
      icon: Icons.message_outlined,
      title: 'Messages',
      isActive: controller.activeDrawerIndex.value == 3,
      onTap: () {
        controller.setActiveIndex(3);
        // Navigate to messages screen
        Get.toNamed('/student/messages');
      },
    ),
    DrawerModel(
      icon: Icons.announcement_outlined,
      title: 'Announcements',
      isActive: controller.activeDrawerIndex.value == 4,
      onTap: () {
        controller.setActiveIndex(4);
        // Navigate to announcements screen
        Get.toNamed('/student/announcements');
      },
    ),
    DrawerModel(
      icon: Icons.settings_outlined,
      title: 'Settings',
      isActive: controller.activeDrawerIndex.value == 5,
      onTap: () {
        controller.setActiveIndex(5);
        // Navigate to settings screen
        Get.toNamed('/student/settings');
      },
    ),
  ];
}
