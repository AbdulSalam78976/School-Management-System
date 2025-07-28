import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/drawer/drawer_model.dart';
import 'package:school_app/common/resources/routes/route_names.dart';

class StudentDrawerData {
  static List<DrawerModel> getStudentDrawerItems() => [
    DrawerModel(
      icon: Icons.dashboard_outlined,
      title: 'Dashboard',
      isActive: false, // This will be managed by the controller
      onTap: () {
        // If on another screen, navigate to home, clearing the stack.
        if (Get.currentRoute != RouteName.studentHomeScreen) {
          Get.offAllNamed(RouteName.studentHomeScreen);
        }
      },
    ),
    DrawerModel(
      icon: Icons.class_outlined,
      title: 'Class',
      isActive: false,
      onTap: () {
        Get.toNamed(RouteName.classScreen);
      },
    ),

    DrawerModel(
      icon: Icons.message_outlined,
      title: 'Messages',
      isActive: false,
      onTap: () {
        Get.toNamed(RouteName.messagesScreen);
      },
    ),
    DrawerModel(
      icon: Icons.announcement_outlined,
      title: 'Announcements',
      isActive: false,
      onTap: () {
        Get.toNamed(RouteName.announcementScreen);
      },
    ),
    DrawerModel(
      icon: Icons.settings_outlined,
      title: 'Settings',
      isActive: false,
      onTap: () {
        Get.toNamed(RouteName.settingScreen);
      },
    ),
  ];
}
