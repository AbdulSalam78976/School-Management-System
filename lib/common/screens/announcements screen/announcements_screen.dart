import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/announcements/announcements_tile.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/screens/announcements%20screen/announcements_controller.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AnnouncementsController>();

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.announcements.length,
              itemBuilder: (context, index) {
                final announcement = controller.announcements[index];
                return AnnouncementsTile(announcement: announcement);
              },
            ),
          ),
        ),
      ),
    );
  }
}
