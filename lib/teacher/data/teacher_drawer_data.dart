import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/drawer/drawer_model.dart';
import 'package:school_app/teacher/screens/screens%20controller/teacher_dashboard_controller.dart';

class TeacherDrawerData {
  static List<DrawerModel> getTeacherDrawerItems(
    TeacherDashboardController controller,
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
      title: 'Classes',
      isActive: controller.activeDrawerIndex.value == 1,
      onTap: () {
        controller.setActiveIndex(1);
        // Navigate to classes screen
        Get.toNamed('/classes');
      },
    ),
    DrawerModel(
      icon: Icons.calendar_today_outlined,
      title: 'Attendance',
      isActive: controller.activeDrawerIndex.value == 2,
      onTap: () {
        controller.setActiveIndex(2);
        // Navigate to attendance screen
        Get.toNamed('/attendance');
      },
    ),
    DrawerModel(
      icon: Icons.message_outlined,
      title: 'Messages',
      isActive: controller.activeDrawerIndex.value == 3,
      onTap: () {
        controller.setActiveIndex(3);
        // Navigate to messages screen
        Get.toNamed('/messages');
      },
    ),
    DrawerModel(
      icon: Icons.announcement_outlined,
      title: 'Announcements',
      isActive: controller.activeDrawerIndex.value == 5,
      onTap: () {
        controller.setActiveIndex(5);
        // Navigate to help screen
        Get.toNamed('/help');
      },
    ),
    DrawerModel(
      icon: Icons.settings_outlined,
      title: 'Settings',
      isActive: controller.activeDrawerIndex.value == 4,
      onTap: () {
        controller.setActiveIndex(4);
        // Navigate to settings screen
        Get.toNamed('/settings');
      },
    ),
  ];
}
